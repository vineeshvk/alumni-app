import 'package:alumni_app/src/models/event_model.dart';
import 'package:flutter/material.dart';

class FeedDetailsScreen extends StatefulWidget {
  final FeedModel feed;

  const FeedDetailsScreen({Key key, this.feed}) : super(key: key);
  @override
  _FeedDetailsScreenState createState() => _FeedDetailsScreenState();
}

class _FeedDetailsScreenState extends State<FeedDetailsScreen> {
  final textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Image.network(widget.feed.image, height: 300),
            Container(height: 20),
            Text("Title", style: textStyle),
            Text(widget.feed.title),
            Container(height: 20),
            Text("Description", style: textStyle),
            Text(widget.feed.description),
            Container(height: 20),
            Text("Scheduled data", style: textStyle),
            Text(widget.feed.scheduledDate),
            Container(height: 20),
            Text("Contact", style: textStyle),
            Text(widget.feed.contact),
            Container(height: 20),
            Text("Venue", style: textStyle),
            Text(widget.feed.venue)
          ],
        ),
      ),
    );
  }
}
