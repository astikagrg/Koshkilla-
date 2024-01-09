import 'package:flutter/material.dart';

TextFormField customTextField(
  TextEditingController controller,
  String label,
  Function validator,
) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(color: Colors.purple), // Set text color to purple
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.black,
      ), // Set label text color to purple
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.purple,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    validator: (value) => validator(value),
  );
}
