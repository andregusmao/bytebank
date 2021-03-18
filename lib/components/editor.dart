import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final IconData icon;

  Editor({this.controller, this.title, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
      child: TextField(
        controller: this.controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: this.icon != null ? Icon(this.icon) : null,
          labelText: this.title,
          hintText: this.hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
