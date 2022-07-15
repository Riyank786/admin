// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SideBar extends StatefulWidget {
  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  String currency = 'One';

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(children: [
          const Icon(
            Icons.supervisor_account_sharp,
            color: Colors.white,
            size: 17,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10), //apply padding horizontal or vertical only
            child: Text("ADMINISTRATOR",
                style: TextStyle(color: Colors.white, fontSize: 12)),
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
              size: 97,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 0.0),
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
              child: const Text(
                'Change Photo',
                style: TextStyle(fontSize: 12.0),
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
                style: TextStyle(fontSize: 12.0),
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
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color.fromARGB(123, 0, 0, 0))),
            ),
            child: const Text(
              "Prefrences",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 22),
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Preferred Currency",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Container(
            width: double.infinity,
            child: DropdownButton(
              isExpanded: true,
              value: currency,
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    currency = newValue;
                  }
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 22),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Preferred Languages",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: DropdownButton(
              isExpanded: true,
              value: currency,
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    currency = newValue;
                  }
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 22, bottom: 2),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Referal Code",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 32,
            child: const TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Text("Link to copy is here"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
              child: const Text(
                'Copy',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ]),
      ),
    ]);
  }
}
