import 'package:alumni_app/src/components/full_screen_widget.dart';
import 'package:alumni_app/src/screens/feed/bloc/event_item_bloc.dart';
import 'package:alumni_app/src/screens/feed/bloc/event_item_state.dart';
import 'package:alumni_app/src/screens/feed/feed_item.dart';
import 'package:alumni_app/src/utils/image_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  EventItemBloc _eventBloc;

  @override
  void initState() {
    _eventBloc = BlocProvider.of<EventItemBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventItemBloc, EventItemState>(
      builder: (context, state) {
        print("state $state");
        if (state is EventItemFetchFailure)
          return FullScreenWidget(
            imageUrl: state.isNetworkError ? ImageResources.errorImage : "",
            child: Text(state.error, textAlign: TextAlign.center),
          );

        if (state is EventItemFetchSuccess) {
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
                return EventItemWidget(event: state.events[index]);
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
    _eventBloc.close();
    super.dispose();
  }
}
