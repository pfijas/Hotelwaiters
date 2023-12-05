import 'dart:convert';
import 'package:flutter/material.dart';

class Tablespage extends StatefulWidget {
  final Function(Map<String, List<String>>, String, bool, int) updateSelectedSeats;
  final Function(List<String>) onSeatTapped;
  final TabController tabController;

  const Tablespage({
    Key? key,
    required this.updateSelectedSeats,
    required this.onSeatTapped,
    required this.tabController,
  }) : super(key: key);

  @override
  State<Tablespage> createState() => _TablespageState();
}

class _TablespageState extends State<Tablespage> {
  final List<TableItem> mockData = [
    TableItem(tableNumber: "T1"),
    TableItem(tableNumber: "T2"),
    TableItem(tableNumber: "T3"),
    TableItem(tableNumber: "T4"),
  ];

  // JSON mock for seats
  final String seatsJson = '''
    [
      {"seatNumber": "S1"},
      {"seatNumber": "S2"},
      {"seatNumber": "S3"},
      {"seatNumber": "S4"}
    ]
  ''';

  List<SeatItem> seats = []; // List to store seat items
  Map<String, List<String>> selectedSeats =
  {}; // Map to store selected seats for each table

  @override
  void initState() {
    super.initState();
    // Parse JSON and populate the seats list
    seats = List<SeatItem>.from(
      json
          .decode(seatsJson)
          .map((seat) => SeatItem(seatNumber: seat["seatNumber"])),
    );
  }

  void clearSelections() {
    setState(() {
      selectedSeats.clear(); // Clear the selected seats
      selectedTable = '';
    });
  }

  Future<void> _showDialog(TableItem table) async {
    if (!selectedSeats.containsKey(table.tableNumber)) {
      selectedSeats[table.tableNumber] = [];
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('${table.tableNumber}')),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    for (SeatItem seat in seats)
                      InkWell(
                        onTap: () {
                          print('Seat tapped: ${seat.seatNumber}');
                          setState(() {
                            if (selectedSeats[table.tableNumber]!
                                .contains(seat.seatNumber)) {
                              // Seat is already selected, show dialog
                              showDuplicateSeatDialog(seat.seatNumber);
                            } else {
                              selectedSeats[table.tableNumber]!
                                  .add(seat.seatNumber);
                            }

                            // Update the selected seats in the table item
                            table.selectedSeats =
                            selectedSeats[table.tableNumber]!;
                          });
                        },
                        child: Card(
                          color: selectedSeats[table.tableNumber]!
                              .contains(seat.seatNumber)
                              ? Colors.blue // Change to blue when selected
                              : Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(seat.seatNumber),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedTable = table.tableNumber;
                      selectedSeats[table.tableNumber]!.sort();
                    });

                    // Pass the selected seats length to the updateSelectedSeats method
                    widget.updateSelectedSeats(
                      selectedSeats,
                      selectedTable,
                      false,
                      table.selectedSeats.length,
                    );
                    widget.tabController
                        .animateTo(1); // 1 is the index of the CATEGORY tab
                    Navigator.of(context).pop();
                  },
                  child: Text('SAVE'),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    clearSelections();
                    widget.updateSelectedSeats(
                      selectedSeats,
                      selectedTable,
                      true,
                      table.selectedSeats.length,
                    );

                    Navigator.of(context).pop();
                  },
                  child: Text('REMOVE'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }


  void showDuplicateSeatDialog(String seatNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Seat Already Booked"),
          content: Text("The seat $seatNumber is already booked."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  String selectedTable = ''; // Ensure this line is present

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockData.length,
              itemBuilder: (context, index) {
                TableItem table = mockData[index];
                return Padding(
                  padding: EdgeInsets.only(top: 9),
                  child: InkWell(
                    onTap: () {
                      widget.onSeatTapped(
                        seats.map((seat) => seat.seatNumber).toList(),
                      );
                      _showDialog(table);
                    },
                    child: Container(
                      height: 140,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 8,
                        child: Column(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      table.tableNumber,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Capacity:4"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Guests: ${table.selectedSeats.length}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TableItem {
  final String tableNumber;
  List<String> selectedSeats; // New property to store selected seats

  TableItem({
    required this.tableNumber,
    this.selectedSeats = const [], // Initialize with an empty list
  });
}

class SeatItem {
  final String seatNumber;

  SeatItem({required this.seatNumber});
}
