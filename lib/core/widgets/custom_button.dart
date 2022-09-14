import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 CustomButton({Key? key,required this.text,required this.onPressed}) : super(key: key);
  String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.red,
      minWidth: double.infinity,
      shape:OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white)
      ) ,
      height: 55,
      child: Text(
        text,
        style: const TextStyle(
         color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
