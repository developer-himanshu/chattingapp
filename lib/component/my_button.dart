// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
// ignore: prefer_typing_uninitialized_variables
final void Function()?onTap;
  final String text;
  const MyButton({super.key,
   required this.text,
   required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary),
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(child: Text(text),
        
        ),
      ),
    );
  }
}