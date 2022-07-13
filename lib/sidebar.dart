import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SideBar();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Icon(Icons.account_circle_rounded, size: 24.0),
                        Text('Administrator', style: TextStyle(fontSize: 25))
                      ])),
            ],
          ))
    ]);
  }
}
