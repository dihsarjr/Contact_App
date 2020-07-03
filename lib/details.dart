import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  String image;
  String name;
  String number;
  Details(this.image, this.name, this.number);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(flex: 2, child: Image.network(widget.image)),
        Expanded(flex: 1, child: Text(widget.name)),
        Expanded(flex: 1, child: Text(widget.number))
      ],
    );
  }
}
