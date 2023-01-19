import 'dart:convert';

import 'package:bid_client/models/bid.dart';
import 'package:bid_client/networking/http_bid_request.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class BidData {
  final Uri? currentBidUrl = getDataFromFirestore();

  Future<Bid?> getBidObjectFromJson() async {
    if (currentBidUrl != null) {
      print(
        "Cloud function running: " + currentBidUrl.toString(),
      );
      final response = await http.get(
        currentBidUrl!,
        headers: <String, String>{
          "Access-Control_Allow_Origin": "*",
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Methods': "GET,POST,OPTIONS,DELETE,PUT"
        },
      );

      print(
        "Finished with status code: " + response.statusCode.toString(),
      );

      if (response.statusCode == 200) {
        try {
          final jsonParser = jsonDecode(response.body);
          Bid bid = Bid.fromMap(jsonParser);
          return bid;
        } catch (e) {
          print(e.toString());
        }
      } else {
        print(
          "ERROR " + response.statusCode.toString(),
        );
        return null;
      }
    } else {
      print(
        'one or more values is null',
      );
      return null;
    }
    return null;
  }
}

Future<Bid?> getBidInfo() async {
  print("getBidInfoRunning");
  final BidData bidData = BidData();
  Bid? bidInfo = await bidData.getBidObjectFromJson();
  print(bidInfo.runtimeType);
  return bidInfo;
}

Future<Bid?> getBidInfoFromMock() async {
  const bidMock = 'assets/bid_mock.json';
  print("get bid info from mock");
  final BidData bidData = BidData();
  try {
    final String response = await rootBundle.loadString('assets/bid_mock.json');
    final data = await json.decode(response);
    Bid? bid = Bid.fromMap(data);
    return bid;
  } catch (e) {
    print(e);
    return null;
  }
}
