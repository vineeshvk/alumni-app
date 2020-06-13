import 'package:alumni_app/src/events/bloc/event_item_bloc.dart';
import 'package:alumni_app/src/events/bloc/event_item_event.dart';
import 'package:alumni_app/src/events/events_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EventItemBloc _eventBloc;

  @override
  initState() {
    _eventBloc = BlocProvider.of<EventItemBloc>(context);
    _eventBloc.add(FetchEventItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Home",
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

  @override
  void dispose() {
    _eventBloc.close();
    super.dispose();
  }
}
