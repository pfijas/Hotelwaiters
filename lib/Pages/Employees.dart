import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Employeespage extends StatefulWidget {
  const Employeespage({Key? key}) : super(key: key);

  @override
  State<Employeespage> createState() => _EmployeespageState();
}

class _EmployeespageState extends State<Employeespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
              color: Colors.white
          ),
          backgroundColor: Colors.blueGrey,
          title: Text("Employees",style: TextStyle(color: Colors.white),)),
      body: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Navigate to HomeScreen and pass the employee name
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(employeeName: "Althaf"),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  width: 80,
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                            "https://img.freepik.com/premium-vector/man-profile-cartoon_18591-58482.jpg?w=740"),
                        Text("Althaf"),
                      ],
                    ),
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(employeeName: "Asif"),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  width: 80,
                  child: Card(
                    child: Column(
                      children: [
                        Image.network("https://img.freepik.com/premium-vector/man-profile-cartoon_18591-58482.jpg?w=740"),
                        Text("Asif"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 80,
                child: Card(
                  child:  Column(
                    children: [
                      Image.network("https://img.freepik.com/premium-vector/man-profile-cartoon_18591-58482.jpg?w=740"),
                      Text("basha")
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 80,
                child: Card(
                  child: Column(
                    children: [
                      Image.network("https://img.freepik.com/premium-vector/man-profile-cartoon_18591-58482.jpg?w=740"),
                    Text("Naseem")
                    ],
                  ), // Replace 'assets/kot_image.png' with your image asset path
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

