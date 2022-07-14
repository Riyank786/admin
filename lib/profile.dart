// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:admin/content.dart';
import 'package:admin/sidebar.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Icon(Icons.account_circle_rounded, size: 24.0),
                Text('Administrator', style: TextStyle(fontSize: 25))
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2, // 20%
                child: new Card(
                  color: Color.fromARGB(255, 25, 69, 146),
                  elevation: 5,
                  child: new Center(
                    child: SideBar(),
                  ),
                )),
            Expanded(
              flex: 8, // 60%
              child: Container(
                // elevation: 5,
                child: new Center(
                  child: Content(),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
