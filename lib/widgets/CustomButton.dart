import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customButton extends StatelessWidget {
  customButton({this.ontap, required this.buttonName});
  final String buttonName;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 30, color: Color(0xff314F6A)),
          ),
        ),
      ),
    );
  }
}
