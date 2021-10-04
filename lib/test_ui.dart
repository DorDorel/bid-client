import 'package:bid_client/connections/bid_data.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

class TestUi extends StatefulWidget {
  const TestUi({Key? key}) : super(key: key);

  @override
  _TestUiState createState() => _TestUiState();
}

class _TestUiState extends State<TestUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test '),
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () async {
                BidData bidData = BidData();
                Bid? bid = await bidData.getBidObjectFromJson();
              },
              child: Text('click'))
        ],
      )),
    );
  }
}
