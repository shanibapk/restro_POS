import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:restro_pos/api_screen.dart';
import 'package:restro_pos/bottom_nav.dart';
import 'package:restro_pos/settingPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int? selectedNumberIndex;
  late TextEditingController _pinController;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
  }

  void _onNumberButtonPressed(String number) {
    if (_pinController.text.length < 4) {
      setState(() {
        _pinController.text += number;
      });
    }
  }

  void _onDeleteButtonPressed() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        _pinController.text =
            _pinController.text.substring(0, _pinController.text.length - 1);
      });
    }
  }

  void _onNumberBoxTapped(int index) {
    if (!_pinController.text.contains(index.toString()) &&
        _pinController.text.length < 4) {
      setState(() {
        _pinController.text += index.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            child: Pinput(
                              length: 4,
                              controller: _pinController,
                              onChanged: (pin) {},
                              defaultPinTheme: PinTheme(
                                width: 80,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 118, 118, 118),
                                    )),
                                textStyle: TextStyle(
                                  fontSize: 36,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _pinController.clear();
                                },
                                child: Container(
                                  width: 160,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2, color: Colors.deepPurple),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      'RESET',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.deepPurple),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var result = await makeLoginApiCall(
                                      _pinController.text);
                                  if (result) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavBar()));
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              Icon(
                                                Icons.error_outline_outlined,
                                                color: Colors.red,
                                                size: 70,
                                              ),
                                              SizedBox(height: 10),
                                              Text('ERROR!',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 82, 82, 82),
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 29),
                                                  )),
                                            ],
                                          ),
                                          content: Text(
                                              'PLEASE ENTER VALID PIN',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 82, 82, 82),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              )),
                                          actions: [
                                            Container(
                                              height: 40,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.deepPurple,
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Center(
                                                child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                    context,
                                                  ),
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: 160,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.deepPurple),
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNumberButton('1', 1),
                              _buildNumberButton('2', 2),
                              _buildNumberButton('3', 3),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNumberButton('4', 4),
                              _buildNumberButton('5', 5),
                              _buildNumberButton('6', 6),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNumberButton('7', 7),
                              _buildNumberButton('8', 8),
                              _buildNumberButton('9', 9),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 0,
                                height: 0,
                              ),
                              settingButton(),
                              _buildNumberButton('0', 0),
                              _buildDeleteButton(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number, int index) {
    bool isSelected = selectedNumberIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNumberIndex = index;
          _onNumberButtonPressed(number);
        });
      },
      child: Container(
        width: 90,
        height: 70,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.deepPurple),
          color: isSelected ? Colors.deepPurple : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
                fontSize: 24, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _onDeleteButtonPressed();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.backspace,
              color: Color.fromARGB(255, 50, 50, 50),
              size: 40,
            ),
          ),
        ),
      ],
    );
  }

  Widget settingButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const Icon(
          Icons.settings,
          color: Color.fromARGB(255, 50, 50, 50),
          size: 45,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}
