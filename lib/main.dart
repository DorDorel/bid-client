import 'package:flutter/material.dart';
import 'connections/http_bid_request.dart';
import 'home/home.dart';

void main() async {
  await getQueryParameters();
  runApp(BidClientApp());
}

class BidClientApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "bid-client",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home()),
    );
  }
}
