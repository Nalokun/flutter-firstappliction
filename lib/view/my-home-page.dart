// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: file_names, empty_constructor_bodies, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/note-home-page.dart';
import 'package:flutter_application_1/shared/data2.dart';
import 'package:flutter_application_1/view/note-page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NoteHomePage homepage = NoteHomePage("Note", TextEditingController(text: ""));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (homepage.appbar)
              Text(
                homepage.title,
                style: TextStyle(fontSize: 30),
              ),
          ],
        ),
        actions: [
          InkWell(
              onTap: () {
                setState(() {
                  homepage.appbar = false;
                  addsearch(homepage.search.text);
                });
              },
              child: Icon(
                Icons.search,
                size: 30,
              )),
          if (!homepage.appbar)
            Row(
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    controller: homepage.search,
                    decoration: InputDecoration(hintText: "search"),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        search = [];
                        homepage.appbar = true;
                      });
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.black,
                    ))
              ],
            )
        ],
      ),
      floatingActionButton: addNote(),
      body: ListView(
        children: [
          if (homepage.appbar)
            for (int i = 0; i < da.data.length; i++) notes(i),
          if (!homepage.appbar)
            for (int i = 0; i < search.length; i++) notes(i),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FloatingActionButton addNote() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (homepage.appbar == false) {
            return;
          }
          var temp = NotePage();
          // var title = temp.title;
          // var dec = temp.title;
          var back = Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => temp,
            ),
          );
          back.whenComplete(() {
            setState(() {
              if (!temp.isback) {
                da.data.add(temp);
              } else {
                temp.isback = false;
              }
            });
          });
        });
  }

  InkWell notes(int i) {
    return InkWell(
      onTap: () {
        var back = Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => da.data[i],
          ),
        );
        back.whenComplete(() {
          setState(() {});
        });
      },
      child: Text(
        da.data[i].title.text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
