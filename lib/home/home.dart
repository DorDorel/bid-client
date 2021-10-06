import 'package:bid_client/connections/bid_data.dart';
import 'package:bid_client/models/bid.dart';
import 'package:bid_client/widgets/bid_info.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Bid?>(
        future: getBidInfo(),
        builder: (context, AsyncSnapshot<Bid?> bidInfo) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.phone_android)),
                ],
                title:
                    Text(bidInfo.hasData ? bidInfo.data!.bidId : "One Moment"),
              ),
              body: bidInfo.hasData
                  ? BidDetails(bidInfo: bidInfo)
                  : Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    )));
        });
  }
}
