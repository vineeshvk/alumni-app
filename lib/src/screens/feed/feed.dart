import 'package:alumni_app/src/components/full_screen_widget.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_bloc.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_event.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_state.dart';
import 'package:alumni_app/src/screens/feed/feed_item.dart';
import 'package:alumni_app/src/utils/image_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  FeedBloc _feedBloc;

  @override
  initState() {
    _feedBloc = BlocProvider.of<FeedBloc>(context);
    _feedBloc.add(FetchFeedEvent());
    super.initState();
  }

  @override
  void dispose() {
    print("from dispose event");
    _feedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _feedBloc.add(FetchFeedEvent());
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
              getFeedListWidget()
            ],
          ),
        ),
      ),
    );
  }

  getFeedListWidget() {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        print("state $state");
        if (state is FeedFetchFailure)
          return FullScreenWidget(
            imageUrl: state.isNetworkError ? ImageResources.errorImage : "",
            child: Text(state.error, textAlign: TextAlign.center),
          );

        if (state is FeedFetchSuccess) {
          if (state.events.length == 0)
            return FullScreenWidget(
              imageUrl: ImageResources.emptyImage,
              child: Text(
                "There are no events yet.",
                textAlign: TextAlign.center,
              ),
            );
          return Expanded(
            child: ListView.separated(
              itemCount: state.events.length,
              padding: EdgeInsets.only(top: 15),
              physics: BouncingScrollPhysics(),
              separatorBuilder: (ctx, i) => Container(height: 15),
              itemBuilder: (context, index) {
                return FeedItemWidget(event: state.events[index]);
              },
            ),
          );
        }
        return FullScreenWidget(child: CupertinoActivityIndicator());
      },
    );
  }
}
