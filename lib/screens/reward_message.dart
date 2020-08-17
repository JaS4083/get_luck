import 'package:flutter/material.dart';
import 'package:get_luck/constants/constants.dart';

class RewardMessage extends StatelessWidget {
  final int scoreMatch;

  RewardMessage({this.scoreMatch});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber.shade500,
      title: new Text(kRewardTextTop, style: kRewardWindowTextStyle),
      content: new Image(
        image: NetworkImage(kLuckUrls[scoreMatch % kLuckUrls.length]),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text(kRewardTextBottom, style: kRewardWindowTextStyle),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
