// ignore_for_file: deprecated_member_use

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

  Map<String, dynamic> settings = {
    "p_name": "",
    "p_accountType": "",
    "p_email": "",
    "p_phone": "",
    "p_address1": "",
    "p_address2": "",
    "p_country": "",
    "p_state": "",
    "p_postCode": "",
    "p_city": "",
    //company
    "c_address1": "",
    "c_address2": "",
    "c_country": "",
    "c_state": "",
    "c_postCode": "",
    "c_city": "",
    // payment
    "py_bankName": "",
    "py_address": "",
    "py_address2": "",
    "py_country": "",
    "py_state": "",
    "py_postCode": "",
    "py_city": "",
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
  var p_country = TextEditingController();
  var p_state = TextEditingController();
  var p_postCode = TextEditingController();
  var p_city = TextEditingController();

  // company

  var c_address1 = TextEditingController();
  var c_address2 = TextEditingController();
  var c_country = TextEditingController();
  var c_state = TextEditingController();
  var c_postCode = TextEditingController();
  var c_city = TextEditingController();

  var py_bankName = TextEditingController();
  var py_address = TextEditingController();
  var py_address2 = TextEditingController();
  var py_country = TextEditingController();
  var py_state = TextEditingController();
  var py_postCode = TextEditingController();
  var py_city = TextEditingController();
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

            settings = storage.getItem(key);
            // profile
            p_name.text = settings['p_name'];
            p_accountType.text = settings['p_accountType'];
            p_email.text = settings['p_email'];
            p_phone.text = settings['p_phone'];
            p_address1.text = settings['p_address1'];
            p_address2.text = settings['p_address2'];
            p_country.text = settings['p_country'];
            p_state.text = settings['p_state'];
            p_postCode.text = settings['p_postCode'];
            p_city.text = settings['p_city'];
            // company
            c_address1.text = settings['c_address1'];
            c_address2.text = settings['c_address2'];
            c_country.text = settings['c_country'];
            c_state.text = settings['c_state'];
            c_postCode.text = settings['c_postCode'];
            c_city.text = settings['c_city'];

            // payment
            py_bankName.text = settings['py_bankName'];
            py_address.text = settings['py_address'];
            py_address2.text = settings['py_address2'];
            py_country.text = settings['py_country'];
            py_state.text = settings['py_state'];
            py_postCode.text = settings['py_postCode'];
            py_city.text = settings['py_city'];
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
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    : const Text(
                                        'Save',
                                        style: TextStyle(fontSize: 20.0),
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
                                  TextFormField(
                                    controller: p_name,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        // fontSize: 24,
                                        // color: Colors.blue,
                                        // fontWeight: FontWeight.w600,

                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_name'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    controller: p_accountType,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        // fontSize: 24,
                                        // color: Colors.blue,
                                        // fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_accountType'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    controller: p_email,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_email'] = value;
                                      });
                                    },
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
                                        TextFormField(
                                          controller: p_phone,
                                          readOnly: !isProfileEdit,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          style: const TextStyle(
                                              // fontSize: 24,
                                              // color: Colors.blue,
                                              // fontWeight: FontWeight.w600,
                                              height: 0.1),
                                          onChanged: (value) {
                                            setState(() {
                                              settings['p_phone'] = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        children: [
                                          FlatButton(
                                            color: Colors.blueAccent,
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.all(15),
                                            onPressed: () {},
                                            child: const Text(
                                              'Change Phone',
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
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
                                  TextFormField(
                                    controller: p_address1,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_address1'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    controller: p_address2,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_address2'] = value;
                                      });
                                    },
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
                                    "Country",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: p_country,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_country'] = value;
                                      });
                                    },
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "State",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: p_state,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_state'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    controller: p_postCode,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_postCode'] = value;
                                      });
                                    },
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
                                  const Text(
                                    "City",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: p_city,
                                    readOnly: !isProfileEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['p_city'] = value;
                                      });
                                    },
                                  )
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
              SizedBox(
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
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    : const Text(
                                        'Save',
                                        style: TextStyle(fontSize: 20.0),
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
                                    "Company Address",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    readOnly: isCompanyEdit,
                                    controller: c_address1,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['c_address1'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    readOnly: isCompanyEdit,
                                    controller: c_address2,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['c_address2'] = value;
                                      });
                                    },
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
                                    "Country",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    readOnly: isCompanyEdit,
                                    controller: c_country,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['c_country'] = value;
                                      });
                                    },
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "State",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    readOnly: isCompanyEdit,
                                    controller: c_state,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['c_state'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    readOnly: isCompanyEdit,
                                    controller: c_postCode,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['c_postCode'] = value;
                                      });
                                    },
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
                                  const Text(
                                    "City",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    readOnly: isCompanyEdit,
                                    controller: c_city,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['c_city'] = value;
                                      });
                                    },
                                  )
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
              SizedBox(
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
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    : const Text(
                                        'Save',
                                        style: TextStyle(fontSize: 20.0),
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
                                  TextFormField(
                                    controller: py_bankName,
                                    readOnly: !paymentEdit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['py_bankName'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    readOnly: !paymentEdit,
                                    controller: py_address,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['py_address'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    readOnly: !paymentEdit,
                                    controller: py_address2,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['py_address2'] = value;
                                      });
                                    },
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
                                    "Country",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    readOnly: !paymentEdit,
                                    controller: py_country,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['py_country'] = value;
                                      });
                                    },
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "State",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    readOnly: !paymentEdit,
                                    controller: py_state,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['py_state'] = value;
                                      });
                                    },
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
                                  TextFormField(
                                    readOnly: !paymentEdit,
                                    controller: py_postCode,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['py_postCode'] = value;
                                      });
                                    },
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
                                  const Text(
                                    "City",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    readOnly: !paymentEdit,
                                    controller: py_city,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                        //fontSize: 24,
                                        //  color: Colors.blue,
                                        //fontWeight: FontWeight.w600,
                                        height: 0.1),
                                    onChanged: (value) {
                                      setState(() {
                                        settings['py_city'] = value;
                                      });
                                    },
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
                                      TextFormField(
                                        readOnly: !paymentEdit,
                                        controller: py_swiftCode,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                        style: const TextStyle(
                                            // fontSize: 24,
                                            // color: Colors.blue,
                                            // fontWeight: FontWeight.w600,
                                            height: 0.1),
                                        onChanged: (value) {
                                          setState(() {
                                            settings['py_swiftCode'] = value;
                                          });
                                        },
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
                                      TextFormField(
                                        readOnly: !paymentEdit,
                                        controller: py_IBAN,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                        style: const TextStyle(
                                            // fontSize: 24,
                                            // color: Colors.blue,
                                            // fontWeight: FontWeight.w600,
                                            height: 0.1),
                                        onChanged: (value) {
                                          setState(() {
                                            settings['py_IBAN'] = value;
                                          });
                                        },
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
    print('saving to storage');
    print(settings['p_name']);
    storage.setItem(key, settings);
  }
}
