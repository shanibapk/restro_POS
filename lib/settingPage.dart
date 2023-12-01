import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            height: 550,
            width: 450,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5, 5),
                      blurRadius: 10,
                      spreadRadius: 5)
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text('Enter Base URL:',
                    style: GoogleFonts.lilitaOne(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 84, 84, 84),
                          //fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  width: 420,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 2.5, color: Colors.deepPurple)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _urlController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter URL',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 60.0),
                GestureDetector(
                  onTap: () {
                    _saveBaseUrlAndPop();
                  },
                  child: Container(
                      width: 150,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveBaseUrlAndPop() async {
    String newBaseUrl = _urlController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('BaseUrl', newBaseUrl);
    print('Saved new BaseUrl: $newBaseUrl');
    Navigator.pop(context);
  }
}
