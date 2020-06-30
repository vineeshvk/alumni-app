import 'package:alumni_app/src/components/feed_item.dart';
import 'package:alumni_app/src/components/full_screen_widget.dart';
import 'package:alumni_app/src/screens/add-feed/add_feed.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_bloc.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_event.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_state.dart';
import 'package:alumni_app/src/utils/colors.dart';
import 'package:alumni_app/src/utils/image_resources.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  FeedBloc _feedBloc;

  @override
  initState() {
    _feedBloc = BlocProvider.of<FeedBloc>(context);
    _feedBloc.add(FetchFeedEvent());
    super.initState();
  }

  void _onAddFeedButtonPressed() {
    Navigator.pushNamed(context, AddFeedScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _onAddFeedButtonPressed,
          backgroundColor: PRIMARY_DARK,
          foregroundColor: Colors.white,
          // child: Icon(Icons.add),
          label: Text("Feed"),
          icon: Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                StringResources.feedText,
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
        if (state is FeedFetchFailureState)
          return FullScreenWidget(
            imageUrl: state.isNetworkError ? ImageResources.errorImage : "",
            child: Text(state.error, textAlign: TextAlign.center),
          );

        if (state is FeedFetchSuccessState) {
          if (state.events.length == 0)
            return FullScreenWidget(
              imageUrl: ImageResources.emptyImage,
              child: Text(
                StringResources.noFeedsText,
                textAlign: TextAlign.center,
              ),
            );
          return Expanded(
            child: ListView.separated(
              itemCount: 10 ?? state.events.length,
              padding: EdgeInsets.only(top: 15),
              physics: BouncingScrollPhysics(),
              separatorBuilder: (ctx, i) => Container(height: 15),
              itemBuilder: (context, index) {
                return FeedItemWidget(event: state.events[1]);
              },
            ),
          );
        }
        return FullScreenWidget(child: CupertinoActivityIndicator());
      },
    );
  }

  @override
  void dispose() {
    _feedBloc.close();
    super.dispose();
  }
}
