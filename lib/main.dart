import 'dart:convert';

import 'package:contacts_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ContactModel> _contacts = List<ContactModel>();

  Future<List<ContactModel>> fetchContacts() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(url);
    var contacts = List<ContactModel>();
    if (response.statusCode == 200) {
      var contactJson = json.decode(response.body);
      for (var contactJson in contactJson) {
        contacts.add(ContactModel.fromJson(contactJson));
      }
    }
    return contacts;
  }

  @override
  void initState() {
    fetchContacts().then((value) {
      setState(() {
        _contacts.addAll(value);
      });
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: Colors.black,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1593355370399-fce3d0d34bdb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FittedBox(
                          child: Text(
                            _contacts[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          _contacts[index].number,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: _contacts.length,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
