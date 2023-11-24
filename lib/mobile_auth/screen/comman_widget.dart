import 'package:flutter/material.dart';

class TextViewTitle extends StatelessWidget {
  final String txt;
  const TextViewTitle({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class InputTextFieldComman extends StatelessWidget {
  final String hintText;
  final String label;
  const InputTextFieldComman(
      {super.key, required this.hintText, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLength: 10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(gapPadding: 4.0),
          hintText: hintText,
          label: Text(label),
        ),
      ),
    );
  }
}

class MyBtnComman extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed;
  const MyBtnComman({super.key, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(txt),
        ),
      ),
    );
  }
}
