import 'package:alumni_app/src/models/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  final EventItemModel event;

  EventItemWidget({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              event.image,
              height: 200,
              fit: BoxFit.fitWidth,
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
