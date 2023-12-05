import 'package:flutter/material.dart';
import 'Category.dart';
import 'Employees.dart';
import 'Items.dart';
import 'Tables.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String? employeeName;

  HomeScreen({Key? key, this.employeeName}) : super(key: key);

  @override
  _HomeScreenPage createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Map<String, String>> currentItems = [];
  List<Map<String, dynamic>> savedKOTData = [];

  List<Map<String, String>> selectedItems = [];
  List<int> selectedNumbers = List.filled(10, 1);
  double overallTotal = 0.0;

  void updateSelectedItems(List<Map<String, String>> items) {
    setState(() {
      for (var item in items) {
        if (!selectedItems.contains(item)) {
          selectedItems.add(item);
        }
      }
      overallTotal = calculateOverallTotal();
    });
  }

  // Function to update quantity and recalculate overallTotal
  void updateQuantity(int index, int newQuantity) {
    setState(() {
      selectedNumbers[index] = newQuantity;
      overallTotal = calculateOverallTotal();
    });
  }
  void removeCard(Map<String, dynamic> data) {
    setState(() {
      savedKOTData.remove(data);
    });
  }

  // Function to calculate the overall total
  double calculateOverallTotal() {
    double total = 0.0;
    for (int i = 0; i < selectedItems.length; i++) {
      double rate = double.parse(selectedItems[i]["rate"] ?? "0.0");
      int qty = selectedNumbers[i];
      if (qty > 0 && rate > 0) {
        total += qty * rate;
      }
    }
    return total;
  }

  Map<String, List<String>> selectedSeats = {};
  String selectedTable = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  void clearOverallTotal() {
    setState(() {
      overallTotal = 0.0;
      selectedItems.clear();
      selectedNumbers = List.filled(10, 1); // Reset quantities to default values
    });
  }

  void onSave(Map<String, dynamic> data) {
    // Check if the data already exists in savedKOTData
    bool dataExists = savedKOTData.any((existingData) =>
    existingData['selectedTable'] == data['selectedTable'] &&
        existingData['selectedSeats'].toString() == data['selectedSeats'].toString());

    // If the data doesn't exist, add it to savedKOTData
    if (!dataExists) {
      setState(() {
        savedKOTData.add(data);
      });
    }

    print('Data saved: $data');
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        hintColor: Colors.black87,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              int currentIndex = tabController.index;
              if (currentIndex == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Employeespage(),
                    ));
              } else if (currentIndex == 1) {
                tabController.animateTo(0);
              } else if (currentIndex == 2) {
                tabController
                    .animateTo(1); // 1 is the index of the CATEGORY tab
              } else if (currentIndex == 3) {
                tabController.animateTo(2); // 2 is the index of the ITEMS tab
              }
            },
          ),
          title: Row(
            children: [
              Text("KOT"),
              Spacer(),
              Text("Staff :", style: TextStyle(fontSize: 17)),
              Text(widget.employeeName ?? "", style: TextStyle(fontSize: 16)),
            ],
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black87,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "TABLES",
              ),
              Tab(
                text: "CATEGORY",
              ),
              Tab(
                text: "ITEMS",
              ),
              Tab(
                text: "RUNNING",
              ),
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Tablespage(
              updateSelectedSeats: (seats, table, clear,guestsCount) {
                setState(() {
                  selectedSeats = seats;
                  selectedTable = table;
                  if (clear) {
                    selectedSeats.clear();
                    selectedTable = '';
                  }
                });
              },
              onSeatTapped: (tappedSeats) {
                print("Tapped Seats: $tappedSeats");
              },
              tabController: tabController, // Pass the tabController
            ),
            Categorypage(
              tabController: tabController,
              onCategoryTap: (items) {
                setState(() {
                  currentItems = items;
                });
              },
              updateSelectedItems: updateSelectedItems,
            ),
            Items(
              items: currentItems,
              updateSelectedItems: updateSelectedItems,
            ),
            RunningPage(
              selectedSeats: selectedSeats,
              selectedTable: selectedTable,
              savedKOTData: savedKOTData,
              onKOTCardTap: handleKOTCardTap,
              removeCard: removeCard,

            ),
          ],
        ),
        bottomNavigationBar: SingleChildScrollView(
          child: Container(
            child: Card(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "KOT:",
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          "Seat: ${selectedSeats.values.join(', ')}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Table No: $selectedTable ",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Divider(thickness: 2, color: Colors.black87),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Item",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(width: 310),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Rate",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 400,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: selectedItems.length,
                                      itemBuilder: (context, index) {
                                        double rate = double.parse(
                                            selectedItems[index]["rate"] ??
                                                "0.0");
                                        int qty = selectedNumbers[index];

                                        // Check if qty and rate are available
                                        if (qty > 0 && rate > 0) {
                                          double total =
                                              qty * rate; // Calculate the total

                                          return Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  selectedItems[index]
                                                          ["name"] ??
                                                      "",
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 40,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text("Qty:"),
                                                      ),
                                                      Spacer(),
                                                      DropdownButton<int>(
                                                        value: selectedNumbers[
                                                            index],
                                                        onChanged:
                                                            (int? newValue) {
                                                          if (newValue !=
                                                              null) {
                                                            updateQuantity(
                                                                index,
                                                                newValue);
                                                            setState(() {
                                                              selectedNumbers[
                                                                      index] =
                                                                  newValue;
                                                            });
                                                          }
                                                        },
                                                        items: List.generate(15,
                                                            (index) {
                                                          return DropdownMenuItem<
                                                              int>(
                                                            value: index + 1,
                                                            child: Text((index +
                                                                    1)
                                                                .toString()),
                                                          );
                                                        }),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 55),
                                              Expanded(
                                                child: Text(
                                                  rate.toString(),
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  total.toString(),
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    // Subtract the removed item's total from overallTotal
                                                    double rate = double.parse(
                                                        selectedItems[index]
                                                                ["rate"] ??
                                                            "0.0");
                                                    int qty =
                                                        selectedNumbers[index];

                                                    if (qty > 0 && rate > 0) {
                                                      double removedTotal =
                                                          qty * rate;
                                                      overallTotal -=
                                                          removedTotal;
                                                    }
                                                    // Remove the item from the selectedItems list
                                                    selectedItems
                                                        .removeAt(index);
                                                    selectedNumbers =
                                                        List.filled(10, 1);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          // If qty or rate is not available, return an empty container
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 500, top: 9),
                          child: Text("Total: $overallTotal",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            elevation: 5,
                            child: IconButton(
                              iconSize: 30,
                              icon: const Icon(
                                Icons.add,
                              ),
                              onPressed: () {
                                setState(() {
                                });
                              },
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            elevation: 5,
                            child: IconButton(
                              iconSize: 30,
                              icon: const Icon(
                                Icons.remove,
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Card(
                            color: Colors.black87,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("NOTE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              clearOverallTotal();
                            },
                            child: Card(
                              color: Colors.black87,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "CLEAR",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(Icons.print, size: 35),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: InkWell(
                              onTap: () {
                                handleKOTCardTap();
                              },
                              child: Card(
                                color: Colors.black87,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "   KOT  ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void handleKOTCardTap() {
    // Implement your logic to save the data and update the UI
    print('KOT Card tapped!');

    // Example: Save the data
    if (selectedTable.isNotEmpty && !savedKOTData.any((data) => data['selectedTable'] == selectedTable)) {
      onSave({
        'selectedTable': selectedTable,
        'selectedSeats': selectedSeats[selectedTable] ?? [],
      });
    }
  }


}
class RunningPage extends StatelessWidget {
  final Map<String, List<String>> selectedSeats;
  final String selectedTable;
  final List<Map<String, dynamic>> savedKOTData;
  final Function() onKOTCardTap;
  final Function(Map<String, dynamic>) removeCard;

  const RunningPage({
    Key? key,
    required this.selectedSeats,
    required this.selectedTable,
    required this.savedKOTData,
    required this.onKOTCardTap,
    required this.removeCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: savedKOTData.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> data = savedKOTData[index];

            return Container(
              height: 200,
              width: 120,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        " ${data['selectedTable']} ",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Divider(thickness: 4, color: Colors.brown),
                      SizedBox(height: 10,),
                      Text(
                        "${(data['selectedSeats'] as List<String>).join(', ')}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Divider(thickness: 0),
                      Text("KOT NO: "),
                      ElevatedButton(
                        onPressed: () {
                          removeCard(data);
                        },
                        child: Text("Clear"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

