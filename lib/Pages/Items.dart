import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final List<Map<String, String>> items;
  final Function(List<Map<String, String>>) updateSelectedItems;

  Items({Key? key, required this.items, required this.updateSelectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: GestureDetector(
                  onTap: () {
                    // Pass the selected item back to the parent widget
                    updateSelectedItems([item]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5.0,
                    child: Container(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            item["image"] ?? "",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8.0),
                          Center(
                            child: Text(
                              item["name"] ?? "",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
