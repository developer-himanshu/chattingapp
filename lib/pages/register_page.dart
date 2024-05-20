// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:chatappp/services/auth/auth_service.dart';
import 'package:chatappp/component/my_button.dart';
import 'package:chatappp/component/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  // tap to go to the register page
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap,});
  //register method
  void register(BuildContext context) {
    //get the auth service
    final _auth = AuthService();
    //password match then create the user
    // ignore: unrelated_type_equality_checks
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Password don't match"),
              ));
    }
    // password don't match show error to the user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),

              //message
              SizedBox(
                height: 50,
              ),
              Text(
                'You have been missed',
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).colorScheme.primary),
              ),
              // textfield
              SizedBox(
                height: 50,
              ),
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: _pwController,
              ),

              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmpwController,
              ),
              // textfield ended

              SizedBox(
                height: 25,
              ),
              // login button code
              MyButton(
                text: 'Register',
                onTap: () => register(context),
              ),

              SizedBox(
                height: 25,
              ),
              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have a account?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      " Login now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
