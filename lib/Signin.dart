// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:restro_pos/api_screen.dart';
// import 'package:restro_pos/homePage.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   late TextEditingController _pinController;
//   @override
//   void initState() {
//     super.initState();
//     _pinController = TextEditingController();
//   }

//   void _onNumberButtonPressed(String number) {
//     if (_pinController.text.length < 4) {
//       setState(() {
//         _pinController.text += number;
//       });
//     }
//   }

//   void _onDeleteButtonPressed() {
//     if (_pinController.text.isNotEmpty) {
//       setState(() {
//         _pinController.text =
//             _pinController.text.substring(0, _pinController.text.length - 1);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Enter the pin',
//               style: TextStyle(
//                 color: Color.fromARGB(255, 0, 0, 0),
//                 fontSize: 25,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             SizedBox(
//               child: Pinput(
//                 length: 4,
//                 controller: _pinController,
//                 onChanged: (pin) {},
//                 defaultPinTheme: PinTheme(
//                   width: 40,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildNumberButton('1'),
//                 _buildNumberButton('2'),
//                 _buildNumberButton('3'),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildNumberButton('4'),
//                 _buildNumberButton('5'),
//                 _buildNumberButton('6'),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildNumberButton('7'),
//                 _buildNumberButton('8'),
//                 _buildNumberButton('9'),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildNumberButton('0'),
//                 _buildDeleteButton(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNumberButton(String number) {
//     return GestureDetector(
//       onTap: () {
//         _onNumberButtonPressed(number);
//       },
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         padding: const EdgeInsets.all(15),
//         decoration:
//             const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
//         child: Text(
//           number,
//           style: const TextStyle(fontSize: 24, color: Colors.white),
//         ),
//       ),
//     );
//   }

//   Widget _buildDeleteButton() {
//     return Row(
//       children: [
//         GestureDetector(
//           onTap: () {
//             _onDeleteButtonPressed();
//           },
//           child: Container(
//             margin: const EdgeInsets.all(10),
//             padding: const EdgeInsets.all(15),
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.black12,
//             ),
//             child: const Icon(
//               Icons.backspace,
//               color: Colors.white,
//               size: 24,
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             var result = await makeLoginApiCall(_pinController.text);
//             if (result) {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => HomePage()));
//             } else {
//               showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                         title: const Text(
//                           'Error Messege',
//                           style: TextStyle(
//                               color: Colors.grey, fontWeight: FontWeight.w900),
//                         ),
//                         content: const Text(
//                           "Invalid pin",
//                           style: TextStyle(
//                               color: Colors.red, fontWeight: FontWeight.w900),
//                         ),
//                         actions: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(10)),
//                               padding: const EdgeInsets.all(14),
//                               child: const Text("okay"),
//                             ),
//                           ),
//                         ],
//                       ));
//             }
//           },
//           child: Container(
//             margin: const EdgeInsets.all(10),
//             padding: const EdgeInsets.all(15),
//             decoration: const BoxDecoration(
//                 shape: BoxShape.circle, color: Colors.black12),
//             child: const Icon(
//               Icons.check,
//               color: Colors.black,
//               size: 24,
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _pinController.dispose();
//     super.dispose();
//   }
// }
