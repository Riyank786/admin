// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SideBar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SideBar();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(children: [
          const Icon(
            Icons.supervisor_account_sharp,
            color: Colors.white,
            size: 27,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10), //apply padding horizontal or vertical only
            child: Text("ADMINISTRATOR",
                style: TextStyle(color: Colors.white, fontSize: 17)),
          ),
        ]),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.account_circle_rounded,
              size: 102,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
              child: const Text(
                'Change Photo',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
              child: const Text(
                'Change Password',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ]),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text('sdg'),
      ),
    ]);
  }
}
