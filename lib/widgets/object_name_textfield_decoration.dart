import 'package:flutter/material.dart';

InputDecoration get objectNameTextFieldDecoration {
  return InputDecoration(
    fillColor: Colors.transparent,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide.none,
    ),
  );
}
