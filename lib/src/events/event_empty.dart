import 'package:flutter/material.dart';

class EventMessageScreen extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const EventMessageScreen({Key key, this.child, this.imageUrl = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (imageUrl != "") ...[
            Image.asset(
              imageUrl,
              width: size.width / 2,
            ),
            Container(height: 8)
          ],
          Center(child: child)
        ],
      ),
    );
  }
}
