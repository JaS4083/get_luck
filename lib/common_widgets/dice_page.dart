import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;
  int scoreMatch = 0;
  String welcomeText = 'Hey there';
  List<String> luckUrls = [
    'https://media.giphy.com/media/OG766ZCawdMZy/giphy.gif',
    'https://media.giphy.com/media/gFi7V9CRBQVW0/giphy.gif',
    'https://media.giphy.com/media/lnlAifQdenMxW/giphy.gif',
    'https://media.giphy.com/media/cnlkXgT2mDahi/giphy.gif',
    'https://media.giphy.com/media/10AYkGR9M75nLW/giphy.gif',
    'https://media.giphy.com/media/xT1R9IrdXK8WnKDXwc/giphy.gif',
    'https://media.giphy.com/media/ddHhhUBn25cuQ/giphy.gif',
    'https://media.giphy.com/media/fVbTigN2xJRlOEdVMh/giphy.gif',
  ];

  void _showRewardPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.amber.shade500,
          title: new Text(
            'YOU ARE LUCKY!!!',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          content: new Image(
            image: NetworkImage(luckUrls[scoreMatch++ % luckUrls.length]),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
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
      },
    );
  }

  void updateDices() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      if (leftDiceNumber == rightDiceNumber) {
        _showRewardPopUp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  welcomeText,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    updateDices();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    updateDices();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Your Luck Score is: $scoreMatch ! ',
                style: TextStyle(
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
