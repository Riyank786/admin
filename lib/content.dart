// ignore_for_file: deprecated_member_use

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Content extends StatefulWidget {
  @override
  ContentState createState() => ContentState();
}

class ContentState extends State<Content> {
  bool isProfileEdit = false;
  bool isCompanyEdit = false;
  bool paymentEdit = false;
  final String key = 'ADMIN_INFO';
  bool initialized = false;
  Map<String, dynamic> inputStyle = {"fontSize": 12, "height": 27};

  Map<String, dynamic> settings = {
    "p_name": "",
    "p_accountType": "",
    "p_email": "",
    "p_phone": "",
    "p_address1": "",
    "p_address2": "",
    "p_country": "India",
    "p_state": "Gujarat",
    "p_postCode": "",
    "p_city": "Vadodara",
    //company
    "c_name": "",
    "c_address1": "",
    "c_address2": "",
    "c_country": "India",
    "c_state": "Gujarat",
    "c_postCode": "",
    "c_city": "Vadodara",
    // payment
    "py_bankName": "",
    "py_address": "",
    "py_address2": "",
    "py_country": "India",
    "py_state": "Gujarat",
    "py_postCode": "",
    "py_city": "Vadodara",
    "py_swiftCode": "",
    "py_IBAN": "",
  };

  // ignore: use_key_in_widget_constructors
  final LocalStorage storage = LocalStorage('admin_profile');
  var p_name = TextEditingController();
  var p_accountType = TextEditingController();
  var p_email = TextEditingController();
  var p_phone = TextEditingController();
  var p_address1 = TextEditingController();
  var p_address2 = TextEditingController();
  var p_postCode = TextEditingController();

  // company
  var c_name = TextEditingController();
  var c_address1 = TextEditingController();
  var c_address2 = TextEditingController();
  var c_postCode = TextEditingController();

  var py_bankName = TextEditingController();
  var py_address = TextEditingController();
  var py_address2 = TextEditingController();
  var py_postCode = TextEditingController();
  var py_swiftCode = TextEditingController();
  var py_IBAN = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.ready,
        initialData: settings,
        builder: (BuildContext context, AsyncSnapshot snap) {
          print('build..');
          if (initialized) {
            print('build..2');

            var temp = storage.getItem(key);
            if (temp != null) {
              settings = temp;
            }
            // profile
            p_name.text = settings['p_name'];
            p_accountType.text = settings['p_accountType'];
            p_email.text = settings['p_email'];
            p_phone.text = settings['p_phone'];
            p_address1.text = settings['p_address1'];
            p_address2.text = settings['p_address2'];
            p_postCode.text = settings['p_postCode'];
            // company
            c_name.text = settings['c_name'];
            c_address1.text = settings['c_address1'];
            c_address2.text = settings['c_address2'];
            c_postCode.text = settings['c_postCode'];

            // payment
            py_bankName.text = settings['py_bankName'];
            py_address.text = settings['py_address'];
            py_address2.text = settings['py_address2'];
            py_postCode.text = settings['py_postCode'];
            py_swiftCode.text = settings['py_swiftCode'];
            py_IBAN.text = settings['py_IBAN'];
          }
          if (!initialized) {
            initialized = true;
          }

          return Column(
            children: [
              Card(
                elevation: 5,
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("ADMINISTRATOR",
                                  style: TextStyle(fontSize: 17)),
                              FlatButton(
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(15),
                                onPressed: () {
                                  if (isProfileEdit) {
                                    saveToStorage();
                                  }
                                  setState(() {
                                    isProfileEdit = !isProfileEdit;
                                  });
                                },
                                child: !isProfileEdit
                                    ? const Text(
                                        'Edit Profile',
                                        style: TextStyle(fontSize: 12.0),
                                      )
                                    : const Text(
                                        'Save',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                              ),
                            ]),
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5, // 50%
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Full Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: p_name,
                                      readOnly: !isProfileEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'ADMINISTRATOR',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5, // 50%
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Acccount Type",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: p_accountType,
                                      readOnly: !isProfileEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'U',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Email / UserName",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: p_email,
                                      readOnly: !isProfileEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'admin@abc.com',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Phone Number",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: inputStyle["height"],
                                          child: TextField(
                                            controller: p_phone,
                                            readOnly: !isProfileEdit,
                                            cursorColor: Colors.black,
                                            style:
                                                const TextStyle(fontSize: 12.0),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: '6165165181',
                                              contentPadding:
                                                  EdgeInsets.all(10.0),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 19),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: inputStyle["height"],
                                            child: FlatButton(
                                              color: Colors.blueAccent,
                                              textColor: Colors.white,
                                              onPressed: () {},
                                              child: const Text(
                                                'Change Phone',
                                                style:
                                                    TextStyle(fontSize: 12.0),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address 1",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: p_address1,
                                      readOnly: !isProfileEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'this is admin account',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address2 (optional)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: p_address2,
                                      readOnly: !isProfileEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'admin',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'Country',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value:
                                              settings['p_country'].toString(),
                                          items: <String>[
                                            'India',
                                            'USA',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: isProfileEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['p_country'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'State',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value: settings['p_state'].toString(),
                                          items: <String>[
                                            'Gujarat',
                                            'Bihar',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: isProfileEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['p_state'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Postcode",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: p_postCode,
                                      readOnly: !isProfileEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '30000',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'City',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value: settings['p_city'].toString(),
                                          items: <String>[
                                            'Vadodara',
                                            'Ahemdabad',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: isProfileEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['p_city'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5,
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Company Name",
                                  style: TextStyle(fontSize: 17)),
                              FlatButton(
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(14),
                                onPressed: () {
                                  if (isCompanyEdit) {
                                    saveToStorage();
                                  }
                                  setState(() {
                                    isCompanyEdit = !isCompanyEdit;
                                  });
                                },
                                child: !isCompanyEdit
                                    ? const Text(
                                        'Edit Company',
                                        style: TextStyle(fontSize: 12.0),
                                      )
                                    : const Text(
                                        'Save',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                              ),
                            ]),
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5, // 50%
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Company Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: c_name,
                                      readOnly: !isCompanyEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Your company name',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5, // 50%
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Company Address",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: c_address1,
                                      readOnly: !isCompanyEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'eg. 1234 main street',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address2 (optional)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: c_address2,
                                      readOnly: !isCompanyEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Appartment or suite',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'Country',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value:
                                              settings['c_country'].toString(),
                                          items: <String>[
                                            'India',
                                            'USA',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: isCompanyEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['c_country'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'State',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value: settings['c_state'].toString(),
                                          items: <String>[
                                            'Gujarat',
                                            'Bihar',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: isCompanyEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['c_state'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Postcode",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: c_postCode,
                                      readOnly: !isCompanyEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '3000',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'City',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value: settings['c_city'].toString(),
                                          items: <String>[
                                            'Vadodara',
                                            'Ahemdabad',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: isCompanyEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['c_city'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5,
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Payment Info",
                                  style: TextStyle(fontSize: 17)),
                              FlatButton(
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(14),
                                onPressed: () {
                                  if (paymentEdit) {
                                    saveToStorage();
                                  }
                                  setState(() {
                                    paymentEdit = !paymentEdit;
                                  });
                                },
                                child: !paymentEdit
                                    ? const Text(
                                        'Edit Payment',
                                        style: TextStyle(fontSize: 12.0),
                                      )
                                    : const Text(
                                        'Save',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                              ),
                            ]),
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1, // 50%
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Bank Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: py_bankName,
                                      readOnly: !paymentEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Name of bank',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Bank Address",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: py_address,
                                      readOnly: !paymentEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'eg. 1234 Main St',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address2 (optional)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: py_address2,
                                      readOnly: !paymentEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Appartment, suite, etc.',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'Country',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value:
                                              settings['py_country'].toString(),
                                          items: <String>[
                                            'India',
                                            'USA',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: paymentEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['py_country'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'State',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value:
                                              settings['py_state'].toString(),
                                          items: <String>[
                                            'Gujarat',
                                            'Bihar',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: paymentEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['py_state'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Postcode",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: inputStyle["height"],
                                    child: TextField(
                                      controller: py_postCode,
                                      readOnly: !paymentEdit,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(fontSize: 12.0),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '30000',
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  )
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 27,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 12.0),
                                        labelText: 'City',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          isExpanded: true,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                          value: settings['py_city'].toString(),
                                          items: <String>[
                                            'Vadodara',
                                            'Ahemdabad',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: paymentEdit
                                              ? (String? newValue) {
                                                  setState(() {
                                                    settings['py_city'] =
                                                        newValue;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Swiftcode",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: inputStyle["height"],
                                        child: TextField(
                                          controller: py_swiftCode,
                                          readOnly: !paymentEdit,
                                          cursorColor: Colors.black,
                                          style:
                                              const TextStyle(fontSize: 12.0),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Swift Code',
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "IBAN Code",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: inputStyle["height"],
                                        child: TextField(
                                          controller: py_IBAN,
                                          readOnly: !paymentEdit,
                                          cursorColor: Colors.black,
                                          style:
                                              const TextStyle(fontSize: 12.0),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'IBAN Code',
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ), // here place whathever child you want
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          const Text('ePay/E-Wallet QR Code'),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            child: const DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ) // here place whathever child you want
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          );
        });
  }

  saveToStorage() {
    settings['p_name'] = p_name.text;
    settings['p_accountType'] = p_accountType.text;
    settings['p_email'] = p_email.text;
    settings['p_phone'] = p_phone.text;
    settings['p_address1'] = p_address1.text;
    settings['p_address2'] = p_address2.text;
    settings['p_postCode'] = p_postCode.text;
    // company
    settings['c_name'] = c_name.text;
    settings['c_address1'] = c_address1.text;
    settings['c_address2'] = c_address2.text;
    settings['c_postCode'] = c_postCode.text;

    // payment
    settings['py_bankName'] = py_bankName.text;
    settings['py_address'] = py_address.text;
    settings['py_address2'] = py_address2.text;
    settings['py_postCode'] = py_postCode.text;
    settings['py_swiftCode'] = py_swiftCode.text;
    settings['py_IBAN'] = py_IBAN.text;

    if (settings['p_email'] != "" && settings['p_email'] != null) {
      print("Email is not empty");
      print(settings['p_email']);
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(settings['p_email']);
      if (!emailValid) {
        setState(() {
          isProfileEdit = !isProfileEdit;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Invalid Email'),
                content: const Text('Please enter a valid email'),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    }
    storage.setItem(key, settings);
  }
}
