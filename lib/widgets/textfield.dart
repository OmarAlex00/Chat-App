import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customFormField extends StatelessWidget {
  customFormField(
      {super.key,
      required this.fieldname,
      required this.placeholder,
      this.onchange,
      this.secure = false});
  final String fieldname;
  final String placeholder;
  Function(String)? onchange;
  bool secure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required!';
        }
        return null;
      },
      onChanged: onchange,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(fieldname, style: const TextStyle(color: Colors.white)),
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
