import 'package:flutter/material.dart';
import 'package:techgebra/storage/sharedpref.dart';

class AccountProvider extends ChangeNotifier {
  Future<void> clearUserData() async {
    await SharedPreferenceHelper.removeUser();
    notifyListeners();
  }
}