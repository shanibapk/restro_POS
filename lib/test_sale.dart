// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:restro_pos/homePage.dart';

// class saleList {
//   int? id;
//   String? inv;
//   String? customer;
//   double? billAmount;

//   saleList({this.id, this.inv, this.customer, this.billAmount});

//   saleList.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     inv = json['inv'];
//     customer = json['customer'];
//     billAmount = json['billAmount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['inv'] = this.inv;
//     data['customer'] = this.customer;
//     data['billAmount'] = this.billAmount;
//     return data;
//   }
// }

// class SaleNew extends StatefulWidget {
//   const SaleNew({Key? key}) : super(key: key);

//   @override
//   State<SaleNew> createState() => _SaleNewState();
// }

// class _SaleNewState extends State<SaleNew> {
//   late List<saleList> sales = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse('http://192.168.1.3:8096/api/Sales/getSales'));

//     if (response.statusCode == 200) {
//       List<dynamic> jsonList = json.decode(response.body);
//       setState(() {
//         sales = jsonList.map((json) => saleList.fromJson(json)).toList();
//         sales.sort((a, b) => b.inv!.compareTo(a.inv!));
//       });
//     } else {
//       throw Exception('Failed to load sales');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: SizedBox(
//         height: 85,
//         width: 85,
//         child: FloatingActionButton(
//           backgroundColor: Colors.deepPurple,
//           focusColor: Colors.grey,
//           onPressed: () {
//             // Navigate to the HomePage
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomePage()));
//           },
//           child: Icon(
//             Icons.add,
//             size: 45,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           saleadetailList(),
//         ],
//       ),
//     );
//   }

//   Widget saleadetailList() {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: ListView.builder(
//           itemCount: sales.length,
//           itemBuilder: (context, index) {
//             saleList sale = sales[index];
//             return Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           offset: Offset(5, 5),
//                           blurRadius: 10,
//                           spreadRadius: 5)
//                     ]),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 10),
//                           Text('INV: ${sale.inv}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 26,
//                               )),
//                           SizedBox(height: 10),
//                           Text('Amount: ${sale.billAmount}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 26,
//                               )),
//                           SizedBox(height: 10),
//                           Text('Customer: ${sale.customer}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 26,
//                               )),
//                         ],
//                       ),
//                     ),
//                     //  my balance code
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
