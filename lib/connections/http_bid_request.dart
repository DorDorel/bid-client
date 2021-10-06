import 'dart:js' as js;

import 'package:bid_client/connections/function_url.dart';

String? tenantId;
String? bidId;

getQueryParameters() {
  var uri = Uri.tryParse(js.context['location']['href']);
  if (uri != null) {
    tenantId = uri.queryParameters['tenant'];
    bidId = uri.queryParameters['bid'];
  }
}

getDataFromFirestore() {
  if (tenantId != null && bidId != null) {
    return Uri.parse('$cloudFunctionUrl/?tenant=$tenantId&bid=$bidId');
  }
  return null;
}
