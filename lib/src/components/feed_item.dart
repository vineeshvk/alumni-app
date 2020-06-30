import 'package:alumni_app/src/models/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedModel event;

  FeedItemWidget({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(
      //     width: 1,
      //     color: Colors.white,
      //   ),
      // ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              event.image,
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(height: 5),
                Text(
                  event.description,
                  maxLines: 4,
                ),
                Container(height: 5)
              ],
            ),
          )
        ],
      ),
    );
  }
}
