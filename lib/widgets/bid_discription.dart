import 'package:flutter/material.dart';

class BidDescription extends StatelessWidget {
  final String productDescription;
  const BidDescription({
    Key? key,
    required this.productDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (_) {
            return Material(
              color: Colors.black.withAlpha(150),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 20.0,
                    minHeight: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
