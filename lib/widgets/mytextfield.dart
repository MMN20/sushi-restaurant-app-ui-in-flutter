import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    );
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(192, 255, 255, 255),
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black54),
            hintText: 'Search here',
            enabledBorder: border,
            focusedBorder: border),
      ),
    );
  }
}
