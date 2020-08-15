import 'package:flutter/material.dart';

const List<String> luckUrls = [
  'https://media.giphy.com/media/OG766ZCawdMZy/giphy.gif',
  'https://media.giphy.com/media/gFi7V9CRBQVW0/giphy.gif',
  'https://media.giphy.com/media/lnlAifQdenMxW/giphy.gif',
  'https://media.giphy.com/media/cnlkXgT2mDahi/giphy.gif',
  'https://media.giphy.com/media/10AYkGR9M75nLW/giphy.gif',
  'https://media.giphy.com/media/xT1R9IrdXK8WnKDXwc/giphy.gif',
  'https://media.giphy.com/media/ddHhhUBn25cuQ/giphy.gif',
  'https://media.giphy.com/media/fVbTigN2xJRlOEdVMh/giphy.gif',
];

class RewardMessage extends StatelessWidget {
  final int scoreMatch;

  RewardMessage({this.scoreMatch});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber.shade500,
      title: new Text(
        'YOU ARE LUCKY!!!',
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      content: new Image(
        image: NetworkImage(luckUrls[scoreMatch % luckUrls.length]),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text(
            "YES!!!",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
