import 'package:firebase/view/login_page.dart';
import 'package:firebase/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewModel with ChangeNotifier {
  void register(String email, String password) {}

  void openLoginPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
}
