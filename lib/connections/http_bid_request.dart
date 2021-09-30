import 'dart:js' as js;

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
    return Uri.parse(
        'https://us-central1-bid-app-98ffc.cloudfunctions.net/getCurrentBidData/?tenant=$tenantId&bid=$bidId');
  }
  return null;
}
