import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_pos/api.dart';
import 'package:restro_pos/api_screen.dart';
import 'package:restro_pos/homePage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController invoiceSearchController = TextEditingController();
  late Future<List<getOrder>> futureOrders;

  @override
  void initState() {
    super.initState();
    futureOrders = fetchGetOrders();
  }

  void resetPage() {
    setState(() {
      invoiceSearchController.clear();
      futureOrders = fetchGetOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 85,
        width: 85,
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          focusColor: Colors.grey,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ).then((_) {
              resetPage(); // Call resetPage after returning from HomePage
            });
          },
          child: Icon(
            Icons.add,
            size: 45,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.deepPurple),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, left: 8),
                      child: TextField(
                        controller: invoiceSearchController,
                        onChanged: (value) {
                          filterOrders(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search Order',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    filterOrders(invoiceSearchController.text);
                  },
                  child: Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        'SEARCH',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 60),
          //   child: Row(
          //     children: [
          //       Container(
          //         height: 70,
          //         width: 520,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             border: Border.all(width: 3, color: Colors.deepPurple)),
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 4, left: 8),
          //           child: TextField(
          //             controller: invoiceSearchController,
          //             onChanged: (value) {
          //               filterOrders(value);
          //             },
          //             decoration: InputDecoration(
          //               hintText: 'Search Order',
          //               border: InputBorder.none,
          //               hintStyle: TextStyle(
          //                   color: Colors.grey,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 23),
          //             ),
          //             style: TextStyle(fontSize: 27),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           filterOrders(invoiceSearchController.text);
          //         },
          //         child: Container(
          //           width: 180,
          //           height: 70,
          //           decoration: BoxDecoration(
          //               color: Colors.deepPurple,
          //               borderRadius: BorderRadius.circular(7)),
          //           child: Center(
          //             child: Text(
          //               'SEARCH',
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.w700),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<getOrder>>(
            future: futureOrders,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return productDetailsList(snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget productDetailsList(List<getOrder> orders) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            getOrder order = orders[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                          spreadRadius: 5)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text('INV:${order.inv}',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              )),
                          SizedBox(height: 10),
                          Text('Amount:${order.billAmount}',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              )),
                          SizedBox(height: 10),
                          Text('Customer: ${order.customer}',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () async {
                              salesModel? editedOrder = await editOrder(
                                order.id,
                              );
                              if (editedOrder != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(
                                      orderToEdit: editedOrder,
                                      type: 'order',
                                    ),
                                  ),
                                ).then((_) {
                                  resetPage(); // Call resetPage after returning from HomePage
                                });
                                // Call resetPage after successful edit
                              }
                              print('List=$editedOrder');
                            },
                            child: Container(
                              width: 140,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              printOrder(context, order.id, 'order');
                            },
                            child: Container(
                              width: 140,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  'Print',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void filterOrders(String searchTerm) {
    setState(() {
      futureOrders = fetchGetOrders().then((orders) => orders
          .where((order) =>
              order.inv!.toLowerCase().contains(searchTerm.toLowerCase()) ||
              order.customer!.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList());
    });
  }
}
