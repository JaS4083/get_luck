import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get_luck/common_widgets/dice_page.dart';

class CustomScaffold extends StatefulWidget {
  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  Color bGroundColor = Color(0x33F44336);

  Color changeColorToRandom() {
    String clr = Random().nextInt(4294967295).toRadixString(16);
    while (clr.length < 9) {
      clr = clr + '0';
    }
    return new Color(int.parse(clr.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          bGroundColor = changeColorToRandom();
        });
      },
      child: Scaffold(
        backgroundColor: bGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Play Dice'),
          ),
        ),
        body: DicePage(),
      ),
    );
  }
}
