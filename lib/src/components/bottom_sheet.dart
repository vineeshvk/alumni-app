import 'package:flutter/material.dart';

class BottomSheetComponent extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const BottomSheetComponent({Key key, this.title, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 500,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(height: 10),
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.grey,
              ),
            ),
            Container(height: 40),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            ...children
          ],
        ),
      ),
    );
  }
}
