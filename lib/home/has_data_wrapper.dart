import 'package:bid_client/home/home.dart';
import 'package:bid_client/models/bid.dart';
import 'package:bid_client/networking/bid_data.dart';
import 'package:flutter/material.dart';

class HasDataWrapper extends StatefulWidget {
  const HasDataWrapper({Key? key}) : super(key: key);

  @override
  _HasDataWrapperState createState() => _HasDataWrapperState();
}

class _HasDataWrapperState extends State<HasDataWrapper> {
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<Bid?>(
    //   future: getBidInfoFromMock(),
    //   builder: (context, AsyncSnapshot<Bid?> mockBidInfo) {
    //     return Scaffold(
    //       body: mockBidInfo.hasData
    //           ? Home(bidInfo: mockBidInfo.data!)
    //           : Text("No Mock Data"),
    //     );
    //   },
    // );

    return FutureBuilder<Bid?>(
      future: getBidInfo(),
      builder: (context, AsyncSnapshot<Bid?> bidInfo) {
        return Scaffold(
          body: Center(
            child: bidInfo.hasData
                ? Home(
                    bidInfo: bidInfo.data!,
                  )
                : Text(
                    "Loading...",
                  ),
          ),
        );
      },
    );
  }
}

//  appBar: PreferredSize(
//             preferredSize: Size.fromHeight(60.0),
//             child: AppBar(
//               backgroundColor: appBarColor,
//               actions: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.phone_android,
//                   ),
//                 ),
//               ],
//               title: Text(
//                 bidInfo.hasData
//                     ? " ${bidNumTitle + " " + bidInfo.data!.bidId + " " + from + " " + bidInfo.data!.companyName}"
//                     // " Bid #${bidInfo.data!.bidId} from ${bidInfo.data!.companyName}"
//                     : waiting,
//                 style: TextStyle(
//                   fontSize: isSmallScreen(context) || isMediumScreen(context)
//                       ? 22
//                       : 16,
//                 ),
//               ),
//             ),
//           ),
//           body: bidInfo.hasData
//               ? BidDetails(bidInfo: bidInfo)
//               : Center(
//                   child: CircularProgressIndicator(
//                     color: appBarColor,
//                   ),
//                 ),
