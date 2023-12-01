import 'package:flutter/material.dart';
import 'package:restro_pos/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // HomePage()
          Builder(
        builder: (BuildContext context) {
          return LoginPage();
        },
      ),
    );
  }
}
 //fetchSAleEdit();
    // print('orderToEdit: ${widget.orderToEdit}');
    // if (widget.orderToEdit != null) {
    //   print(widget.orderToEdit);
    //   toEditOrder = widget.orderToEdit;
    //   setState(() {
    //     selectedProducts = toEditOrder!.detail ?? [];
    //     _buildNewContainers();
    //     print('Selected Products: $selectedProducts');
    //     selectedTableId = toEditOrder!.tableid;
    //     customer = toEditOrder!.customerId!;
    //     netamount = toEditOrder!.totalBillAmount!;
    //     print('Selected Table ID: $selectedTableId');
    //     print('Selected Customer ID: $customer');
    //     print('totalBillAmount=$netamount');
    //   });
    // } else {
    //   resetSelectedProducts();
    // }


   // Set the default value for the customer dropdown
                    // value: customers.firstWhere(
                    //   (customer) => customer.id == toEditOrder?.customerId,
                    //   orElse: () => customers.first, // Provide a default value
                    // ),
                    // onChanged: (getCustomers? selectedCustomer) {
                    //   if (selectedCustomer != null) {
                    //     customer = selectedCustomer.id!;
                    //   }
                    // },



                     // onChanged: (selectedCustomer) {
                    //   if (selectedCustomer != null) {
                    //     customer = selectedCustomer.id!;
                    //   }
                    // },



                     // value: customers.firstWhere(
                    //   (customer) => (customer.id == toEditOrder?.customerId ||
                    //       customer.id == toEditSale?.customerId ||
                    //       customer.id == toEditTable?.customerId),
                    //   orElse: () =>
                    //       getCustomers(id: 0, name: 'Default Customer'),
                    //   //customers.first,
                    // ),
                    // onChanged: (selectedCustomer) {
                    //   if (selectedCustomer != null) {
                    //     customer = selectedCustomer.id!;
                    //   }
                    // },