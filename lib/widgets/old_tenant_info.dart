import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

import '../base_config.dart';

class BidDetails extends StatelessWidget {
  final Bid bidInfo;
  BidDetails({
    required this.bidInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment:
                active_rtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                bidInfo.companyName,
                textDirection: langDirection(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                bidInfo.companyAddress,
                textDirection: TextDirection.rtl,
              ),
              Text(
                bidInfo.companyPhone,
                textDirection: langDirection(),
              ),
              Text(
                bidInfo.companyWebsite,
                textDirection: langDirection(),
              ),
              // intro(bidInfo),
              // isSmallScreen(context) || isMediumScreen(context)
              //     ? SizedBox()
              //     : Center(
              //         child: Text(
              //           " <<< החלק תמונה ",
              //           style: TextStyle(
              //               color: Colors.black26,
              //               fontStyle: FontStyle.italic,
              //               fontSize: 12),
              //         ),
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
