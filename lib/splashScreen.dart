import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_pos/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 15), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(17),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/restro.jpg'),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant,
              size: 150,
              color: Colors.white,
            ),
            Text('Restro POS',
                style: GoogleFonts.lilitaOne(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 80),
                )),
          ],
        ),
      ),
    ));
  }
}
// Future<void> editOrderDetails(
//   int? orderId,
// ) async {
//   var headers = {
//     'Content-Type': 'application/json',
//   };
//   var request = http.Request(
//     'POST',
//     Uri.parse(ApiManager.baseUrl + '/api/Sales/GetOrderById'),
//   );

//   request.body = json.encode({"id": orderId});
//   request.headers.addAll(headers);

//   try {
//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     } else {
//       print('Error: ${response.reasonPhrase}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }
