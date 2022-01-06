import 'package:bid_client/base_config.dart';
import 'package:bid_client/models/bid.dart';
import 'package:bid_client/networking/bid_data.dart';
import 'package:bid_client/widgets/tenant_info.dart';
import 'package:flutter/material.dart';

import '../screen_size_manger.dart';

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
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: AppBar(
                    backgroundColor: appBarColor,
                    actions: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.phone_android)),
                    ],
                    title: Text(
                      bidInfo.hasData
                          ? "הצעת מחיר מספר ${bidInfo.data!.bidId} מ${bidInfo.data!.companyName}"
                          // " Bid #${bidInfo.data!.bidId} from ${bidInfo.data!.companyName}"
                          : "One Moment",
                      style: TextStyle(
                          fontSize:
                              isSmallScreen(context) || isMediumScreen(context)
                                  ? 22
                                  : 16),
                    ),
                  )),
              body: bidInfo.hasData
                  ? BidDetails(bidInfo: bidInfo)
                  : Center(
                      child: CircularProgressIndicator(
                      color: appBarColor,
                    )));
        });
  }
}
