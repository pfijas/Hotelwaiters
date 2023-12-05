// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'Eachproduct.dart';
//
// class menupage extends StatefulWidget {
//   const menupage({Key? key}) : super(key: key);
//
//   @override
//   State<menupage> createState() => _menupageState();
// }
//
// class _menupageState extends State<menupage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//         title: Text(
//           "Menu",
//           style: GoogleFonts.notoSerifLao(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding:
//                       const EdgeInsets.only(right: 0, bottom: 15, top: 10),
//                       child: Text("TEA"),
//                     ),
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailsPage(
//                                   imageUrl:
//                                   "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRlYXxlbnwwfHwwfHx8MA%3D%3D",
//                                   productName: "NORMAL TEA",
//                                   price: "₹15",
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: 130,
//                             width: 100,
//                             child: Column(
//                               children: [
//                                 Card(
//                                   child: Image.network(
//                                       "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRlYXxlbnwwfHwwfHx8MA%3D%3D"),
//                                   color: Colors.blueGrey,
//                                 ),
//                                 Text("NORMAL TEA \n ₹15"),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailsPage(
//                                   imageUrl:
//                                   "https://www.archanaskitchen.com/images/archanaskitchen/beverages/Green_tea_recipe.jpg",
//                                   productName: "GREEN TEA",
//                                   price: "₹20",
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: 130,
//                             width: 100,
//                             child: Column(
//                               children: [
//                                 Card(
//                                   child: Image.network(
//                                       "https://www.archanaskitchen.com/images/archanaskitchen/beverages/Green_tea_recipe.jpg"),
//                                   color: Colors.blueGrey,
//                                 ),
//                                 Text("GREEN TEA \n ₹20"),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://images.unsplash.com/photo-1617191880520-c6a69e04fa75?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmxhY2slMjB0ZWF8ZW58MHx8MHx8fDA%3D"),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("BLACK TEA \n ₹20"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://images.unsplash.com/photo-1519110756001-72f90e894646?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("GINGER TEA \n ₹20"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/153765500/photo/green-tea.jpg?s=612x612&w=0&k=20&c=RioF1mfNQCKAkTrLdA5_Vfo1gIm14nlpkTYKqAHKqy0="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("LEMON TEA \n ₹20"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://images.unsplash.com/34/rcaNUh3pQ9GD8w7Iy8qE__DSC0940.jpg?auto=format&fit=crop&q=80&w=1776&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("MIXED TEA \n ₹30"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsets.only(right: 0, bottom: 15, top: 10),
//                       child: const Text("SNACKS"),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/905492462/photo/pizza-margarita-with-mozzarella-cheese-basil-and-tomato-template-for-your-design-and-menu-of.jpg?s=612x612&w=0&k=20&c=J4L7If3oJp0IrZ5IXEc-_r0WU0HNa7U5Yn4IW7ynuVo="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("PIZZA \n ₹200"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/155159964/photo/chocolate-mousse-bomb-desert-over-a-white-background.jpg?s=2048x2048&w=is&k=20&c=XVWGo6kJajbeA27jvWZeq21G6skOgjmTZMKIFa7TXrY="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("PLUM CAKE \n ₹900"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 140,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/155811935/photo/tasty-sandwich.jpg?s=1024x1024&w=is&k=20&c=_n3lnSnXN2YGRDeL9arSdrEZF6quu8VVvpzohDZHbcA="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("CHICKEN BURGER \n ₹150"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/171586893/photo/foot-long-turkey-club-submarine-sandwich.jpg?s=612x612&w=0&k=20&c=G4be15L_StfLGAZ1DAIY98HiUT0AlTzpv1kSxjYoBR4="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("SANDWICH \n ₹160"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/1416818048/photo/tortilla-wrap-with-fried-chicken-meat-and-vegetables-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=HQpDZlT3PCvRndbCWDDh5CzM5xBGNFHkU0nmXOxBh7o="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("CHICKEN   WRAP \n ₹130"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/502663152/photo/hamburger.jpg?s=612x612&w=0&k=20&c=vxpxqrbn5bU0enbi_-NuJWWycHTStIAvGunpdSi_NaA="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("VEG BURGER \n ₹90"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsets.only(right: 0, bottom: 15, top: 10),
//                       child: Text("JUICES"),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/178052211/photo/mojito.jpg?s=612x612&w=0&k=20&c=HMmDyN6arIDnCMIV7VssPEqPtNjxfTj4lESGUm4NeNE="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("FRESH LIME \n ₹40"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/171114622/photo/glass-of-orange-juice-and-three-oranges-over-white-backdrop.jpg?s=612x612&w=0&k=20&c=R9tzhhF-wYAYm7FoVzabI1iCs9_jMopXM38j6P9HhP8="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("ORANGE \n ₹80"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/467094423/photo/grape-and-juice-isolated.jpg?s=612x612&w=0&k=20&c=sIeLjdEp6hvALkN9THnCA5BsR-7FQ2cyQkBK-9bf3rk="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("GRAPE \n ₹80"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/909084014/photo/mango-drink.jpg?s=612x612&w=0&k=20&c=Qczi-mcVX5fplXuWJKjzY1Xgs-AGovV2hfcG80Syhsw="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("MANGO  \n ₹100"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/1363627627/photo/ripe-papaya-juice.jpg?s=612x612&w=0&k=20&c=3fVidiBIPCUB9--BJV-CPl7QTNFnItm_C7HJyaHfSsc="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("PAPPAYA \n ₹100"),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 130,
//                           width: 100,
//                           child: Column(
//                             children: [
//                               Card(
//                                 child: Image.network(
//                                     "https://media.istockphoto.com/id/479311338/photo/fresh-raspberries-and-juice.jpg?s=612x612&w=0&k=20&c=N6adAv5NzueEloF7gzS6La0DdfdUlI_xE_4H9da9WZs="),
//                                 color: Colors.blueGrey,
//                               ),
//                               Text("STRAWBERRY \n ₹100"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// [
// {"imageUrl":"https://images.unsplash.com/photo-1571934811356-5cc061b6821f?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRlYXxlbnwwfHwwfHx8MA%3D%3D","productName":"NORMAL TEA","price": "₹15"},
// {"imageUrl":""https://www.archanaskitchen.com/images/archanaskitchen/beverages/Green_tea_recipe.jpg","productName": "GREEN TEA","price": "₹20"},
//
// ]
// ''';