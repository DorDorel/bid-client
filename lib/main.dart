import 'package:bid_client/home/has_data_wrapper.dart';
import 'package:flutter/material.dart';

import 'base_config.dart';
import 'networking/http_bid_request.dart';

void main() async {
  await getQueryParameters();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: langDirection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "bid-client",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HasDataWrapper(),
      ),
    );
  }
}
