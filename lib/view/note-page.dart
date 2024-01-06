// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: file_names, empty_constructor_bodies, unnecessary_this
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  NotePage({super.key});
  TextEditingController title = TextEditingController(text: "");
  TextEditingController dec = TextEditingController(text: "");
  bool isback = false;
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myBar(),
      body: ListView(
        children: [
          addText(text: widget.title, hint: "title"),
          addText(text: widget.dec, border: InputBorder.none, hint: "dec")
        ],
      ),
    );
  }

  AppBar myBar() {
    return AppBar(
      title: Text(widget.title.text),
      leading: BackButton(onPressed: () {
        widget.isback = true;
        Navigator.pop(context);
      }),
      actions: [
        IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }

  TextField addText(
      {required TextEditingController text,
      InputBorder? border,
      required String hint}) {
    return TextField(
      style: TextStyle(fontSize: 40, color: Colors.black),
      controller: text,
      decoration: InputDecoration(
        hintText: hint,
        border: border,
      ),
    );
  }
}
