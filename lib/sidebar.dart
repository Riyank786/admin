// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localstorage/localstorage.dart';

class SideBar extends StatefulWidget {
  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  String currency = 'One';
  late final XFile image;
  Uint8List? profileImage;
  String defaultImg = "user.png";
  final LocalStorage storage = LocalStorage('sidebar');
  final String key = 'ADMIN_PROFILE_IMG';
  bool initialized = false;
  int profileImgHeight = 120;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.ready,
        initialData: profileImage,
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (initialized) {
            print('build..2');

            var temp = storage.getItem(key);
            if (temp != null) {
              profileImage = base64Decode(temp); //temp.cast<int>().toList());
              print(temp);
            }
          }
          if (!initialized) {
            initialized = true;
          }

          return Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
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
                      horizontal:
                          10), //apply padding horizontal or vertical only
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
                Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: CircleAvatar(
                        radius: profileImgHeight / 2,
                        backgroundColor: Colors.grey,
                        child: profileImage != null
                            ? ClipOval(
                                child: Image.memory(
                                  profileImage as Uint8List,
                                  fit: BoxFit.cover,
                                  height: profileImgHeight as double,
                                  width: profileImgHeight as double,
                                ),
                              )
                            : ClipOval(
                                child: Image.asset(
                                  defaultImg,
                                  fit: BoxFit.cover,
                                  height: profileImgHeight as double,
                                  width: profileImgHeight as double,
                                ),
                              ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 0.0),
                  child: FlatButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      saveImage();
                    },
                    child: const Text(
                      'Change Photo',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
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
                        bottom:
                            BorderSide(color: Color.fromARGB(123, 0, 0, 0))),
                  ),
                  child: const Text(
                    "Prefrences",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 22),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
              ]),
            ),
          ]);
        });
  }

  saveImage() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      try {
        Uint8List temp = pickedFile.files.first.bytes as Uint8List;
        String img = uint8ListTob64(temp);
        print(img);
        setState(() {
          profileImage = temp;
          saveToStorage(img);
        });
      } catch (err) {
        print('error in picker');
        print(err);
      }
    } else {
      print('No Image Selected');
    }
  }

  saveToStorage(String img) {
    storage.setItem(key, img);
  }

  String uint8ListTob64(Uint8List uint8list) {
    String base64String = base64Encode(uint8list);
    return base64String;
  }
}
