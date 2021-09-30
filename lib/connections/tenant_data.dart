import 'dart:convert';

import 'package:bid_client/models/tenant.dart';
import 'package:http/http.dart' as http;

import 'http_bid_request.dart';

class TenantData {
  final currentBidUrl = getDataFromFirestore();

  Future<Tenant?> getTenantInfo() async {
    if (currentBidUrl != null) {
      final response = await http.post(
        currentBidUrl,
        headers: <String, String>{
          "Access-Control_Allow_Origin": "*",
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Methods': "GET,POST,OPTIONS,DELETE,PUT"
        },
      );
      if (response.statusCode == 200) {
        final jsonParser = jsonDecode(response.body);
        Tenant tenant = Tenant.fromMap(jsonParser["tenantInfo"]);
        return tenant;
      } else {
        print("ERROR " + response.statusCode.toString());
        return null;
      }
    } else {
      print('one or more values is null');
      return null;
    }
  }
}
