import 'package:bid_client/base_config.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

Widget agentInfo({required Bid bidInfo}) {
  TextStyle style1 = TextStyle(fontSize: 16.0);
  TextStyle style2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
  return Directionality(
    textDirection: langDirection(),
    child: Center(
      child: Column(
        children: [
          Text(
              "אם ברצונך לדון בהצעת מחיר זו, או אם יש לך שאלות נוספות אודות הצעה זו, אשמח אם תיצור איתי קשר בהקדם:"),
          Text(
            "הנייד האישי שלי: ${bidInfo.creatorPhone}",
            style: style1,
          ),
          Text(
            "הדוא״ל שלי: ${bidInfo.creatorMail}",
            style: style1,
          ),
          SizedBox(
            height: 80.0,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            alignment: Alignment.bottomLeft,
            child: Text(
              "בכבוד רב, \n ${bidInfo.creatorName}",
              style: style2,
            ),
          )
        ],
      ),
    ),
  );
}
