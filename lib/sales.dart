import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_pos/api.dart';
import 'package:restro_pos/api_screen.dart';
import 'package:restro_pos/homePage.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  TextEditingController salesInvoiceSearchController = TextEditingController();
  List<getSales> salesData = [];
  List<getSales> displayedSales = [];
  List<getSales> searchResults = [];
  bool isLoading = true;

  late Timer timer;
  @override
  void initState() {
    super.initState();
    fetchSalesData();

    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      fetchSalesData();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> fetchSalesData() async {
    await fetchGetSalesData().then((data) {
      setState(() {
        salesData = data;
        salesData.sort((a, b) => b.inv!.compareTo(a.inv!));
        displayedSales =
            List.from(salesData); // Preserve search results if available
        if (salesInvoiceSearchController.text.isNotEmpty) {
          filterSales(salesInvoiceSearchController.text);
        } else {
          displayedSales = List.from(salesData);
        }
        isLoading = false;
      });
    });
  }

  void filterSales(String searchTerm) {
    setState(() {
      searchResults = salesData
          .where((sale) =>
              sale.inv!.toLowerCase().contains(searchTerm.toLowerCase()) ||
              sale.customer!.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();

      if (searchTerm.isNotEmpty) {
        displayedSales = List.from(searchResults);
      } else {
        displayedSales = List.from(salesData);
      }
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
                    builder: (context) => HomePage(
                        //  type: 'sale',
                        )));
          },
          child: Icon(
            Icons.add,
            size: 45,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 520,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.deepPurple)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8),
                    child: TextField(
                      controller: salesInvoiceSearchController,
                      onChanged: (value) {
                        filterSales(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search invoice',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                      style: TextStyle(fontSize: 27),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    filterSales(salesInvoiceSearchController.text);
                  },
                  child: Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        'SEARCH',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: displayedSales.length,
                    itemBuilder: (context, index) {
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                        'INV:${displayedSales[index].inv ?? ""}',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26),
                                        )),
                                    SizedBox(height: 10),
                                    Text(
                                        'Amount: ${displayedSales[index].billAmount?.toStringAsFixed(3) ?? ""}',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26),
                                        )),
                                    SizedBox(height: 10),
                                    Text(
                                        'Customer:${displayedSales[index].customer ?? ""}',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 160,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () async {
                                            salesModel? editedSale =
                                                await editSale(
                                              displayedSales[index].id,
                                            );
                                            if (editedSale != null) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                    saleToEdit: editedSale,
                                                    type: 'sale',
                                                  ),
                                                ),
                                              );
                                            }
                                            print('List=$editedSale');
                                          },
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
                                        printSales(context,
                                            displayedSales[index].id, 'sales');
                                      },
                                      child: Container(
                                        width: 160,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius:
                                                BorderRadius.circular(25)),
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
        ],
      ),
    );
  }
}
