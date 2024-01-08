import 'package:firebase/view/register_page.dart';
import 'package:firebase/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  void login(String email, String password) {}

  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: RegisterPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
}
