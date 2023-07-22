import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techgebra/screens/login_screen.dart';
import 'package:techgebra/screens/profile_screen.dart';
import 'package:techgebra/storage/sharedpref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String isLoggedin = '';
  Future getValidationData() async {
    await SharedPreferenceHelper.getUsername().then((value) {
      setState(() {
        if (value != null) {
          isLoggedin = value;
        }
      });
    });
  }
  @override
  void initState() {

    getValidationData();
    Timer(const Duration(seconds: 2), () async {

        isLoggedin.isEmpty
            ? Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()))
            :Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
      }
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
