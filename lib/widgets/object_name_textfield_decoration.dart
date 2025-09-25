import 'package:flutter/material.dart';

InputDecoration objectNameTextFieldDecoration() {
  return InputDecoration(
    fillColor: Colors.transparent,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide.none,
    ),
  );
}
