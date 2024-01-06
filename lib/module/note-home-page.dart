// ignore_for_file: file_names, empty_constructor_bodies, unnecessary_this

import 'package:flutter/material.dart';

class NoteHomePage {
  late String title;
  late TextEditingController search;
  late bool appbar;
  NoteHomePage(String t, TextEditingController s) {
    this.title = t;
    this.search = s;
    appbar = true;
  }
}
