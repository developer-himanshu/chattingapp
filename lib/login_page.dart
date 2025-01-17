// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatappp/services/auth/auth_service.dart';
import 'package:chatappp/component/my_button.dart';
import 'package:chatappp/component/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
// yha paas hum controler bana rhe h email and pw ka

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
// tap to go to the register page
final void Function()?onTap;

  LoginPage({super.key, required this.onTap});

  // login method

  void login(BuildContext context) async{
    // auth service
    final authService=AuthService();
// try login
try{
  await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
}
// catch any error occur

catch(e){
  showDialog(context: context, builder: (context) => AlertDialog(title: Text(e.toString()),),);
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
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
              hintText: "email",
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              hintText: "password",
              obscureText: true,
              controller: _pwController,
            ),
// textfield ended

            SizedBox(
              height: 25,
            ),
// login button code
            MyButton(
              text: 'Login',
              onTap:()=>login(context),
            ),

            SizedBox(
              height: 25,
            ),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text("Not a member?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap:onTap,
                  child: Text(" Register now", style: TextStyle(fontWeight: FontWeight.bold, 
                  color: Theme.of(context).colorScheme.primary), ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
