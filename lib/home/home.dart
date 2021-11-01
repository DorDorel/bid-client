import 'package:bid_client/connections/bid_data.dart';
import 'package:bid_client/models/bid.dart';
import 'package:bid_client/widgets/tenant_info.dart';
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
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: AppBar(
                    backgroundColor: Colors.teal[300],
                    actions: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.phone_android)),
                    ],
                    title: Text(bidInfo.hasData
                        ? " Bid ${bidInfo.data!.bidId} from ${bidInfo.data!.companyName}"
                        : "One Moment"),
                  )),
              body: bidInfo.hasData
                  ? BidDetails(bidInfo: bidInfo)
                  : Center(
                      child: CircularProgressIndicator(
                      color: Colors.teal,
                    )));
        });
  }
}
