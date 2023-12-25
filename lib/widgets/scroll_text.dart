import 'package:flutter/material.dart';

class ScrollText extends StatelessWidget {
  const ScrollText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "   החלק ימינה >>> ",
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.grey,
      ),
    );
  }
}
