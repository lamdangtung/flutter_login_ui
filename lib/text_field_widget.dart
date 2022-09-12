import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.hintText,
      required this.prefixIconData,
      this.onTap,
      this.suffixIconData,
      this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final bool? obscureText;
  final Function(String) onChanged;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      controller: controller,
      cursorColor: Colors.lightBlue,
      style: const TextStyle(fontSize: 14, color: Colors.lightBlue),
      decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: Colors.lightBlue,
          ),
          suffixIcon: suffixIconData != null
              ? Icon(
                  suffixIconData,
                  size: 18,
                  color: Colors.lightBlue,
                )
              : null,
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.lightBlue, width: 1.0),
          ),
          filled: true,
          labelStyle: const TextStyle(color: Colors.lightBlue, fontSize: 14)),
    );
  }
}
