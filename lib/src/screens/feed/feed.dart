import 'package:alumni_app/src/screens/feed/bloc/event_item_bloc.dart';
import 'package:alumni_app/src/screens/feed/bloc/event_item_event.dart';
import 'package:alumni_app/src/screens/feed/feed_l.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EventItemBloc _eventBloc;
  int count = 0;

  @override
  initState() {
    _eventBloc = BlocProvider.of<EventItemBloc>(context);
    _eventBloc.add(FetchEventItems());
    super.initState();
  }

  @override
  void dispose() {
    print("from dispose event");
    _eventBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("$count"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  count++;
                });
                _eventBloc.add(FetchEventItems());
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Events",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              EventList()
            ],
          ),
        ),
      ),
    );
  }
}
