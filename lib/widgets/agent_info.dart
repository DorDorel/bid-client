import 'package:bid_client/base_config.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

Widget agentInfo(AsyncSnapshot<Bid?> bidInfo) {
  TextStyle style1 = TextStyle(fontSize: 16.0);
  TextStyle style2 = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);
  return Directionality(
    textDirection: langDirection(),
    child: Center(
      child: Column(children: [
        Text(
            "אם ברצונך לדון בהצעת מחיר זו, או אם יש לך שאלות נוספות אודות הצעה זו, אשמח אם תיצור איתי קשר בהקדם:"),
        Text(
          "הנייד האישי שלי: ${bidInfo.data!.creatorPhone}",
          style: style1,
        ),
        Text(
          "הדוא״ל שלי: ${bidInfo.data!.creatorMail}",
          style: style1,
        ),
        SizedBox(
          height: 80.0,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "בכבוד רב, \n ${bidInfo.data!.creatorName}",
            style: style2,
          ),
        )
      ]),
    ),
  );
}
