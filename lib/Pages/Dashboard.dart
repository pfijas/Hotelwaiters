import 'package:flutter/material.dart';

import 'Employees.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({Key? key}) : super(key: key);

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Dashboard",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Employeespage()),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: 100,
                    child: Card(
                      child: Column(
                        children: [
                          Image.network("https://icon-library.com/images/staff-icon/staff-icon-4.jpg"),
                          Spacer(),
                          Text("Employees"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width:100),
                Container(
                  height: 120,
                  width: 100,
                  child: Card(
                    child: Column(
                      children: [
                        Image.network("https://cdni.iconscout.com/illustration/premium/thumb/chef-3462294-2895976.png"),
                        Spacer(),
                        Text("KOT"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 100,
                  child: Card(
                    child: Column(
                      children: [
                        Image.network("https://cdni.iconscout.com/illustration/premium/thumb/business-manager-planning-workflow-4633347-3838849.png"),
                        Spacer(),
                        Text("POS"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 100),
                Container(
                  height: 120,
                  width: 100,
                  child: Card(
                    child: Column(
                      children: [
                        Image.network("https://cdn3d.iconscout.com/3d/premium/thumb/delivery-person-riding-scooter-5349142-4466370.png"),
                        Spacer(),
                        Text("Take Away"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 100,
                  child: Card(
                    child: Column(
                      children: [
                        Image.network("https://cdn3d.iconscout.com/3d/premium/thumb/man-and-woman-communicating-with-each-other-4620319-3917176.png"
                        ),
                        Spacer(),
                        Text("Message"),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
