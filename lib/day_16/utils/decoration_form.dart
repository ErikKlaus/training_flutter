import 'package:flutter/material.dart';

InputDecoration decorationConstant({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
  );
}
