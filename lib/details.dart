import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  String image;
  String name;
  String number;
  String email;
  Details(this.image, this.name, this.number, this.email);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(child: Image.network(widget.image)),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      'Name: ${widget.name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Phone: ${widget.number}'),
                  Text('Email: ${widget.email}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
