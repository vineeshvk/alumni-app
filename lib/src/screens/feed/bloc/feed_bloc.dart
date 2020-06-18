import 'package:alumni_app/src/models/event_model.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_event.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_repository.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  @override
  FeedState get initialState => FeedInitiatedState();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    try {
      if (event is FetchFeedEvent) {
        yield* _mapFetchFeedToState();
      }
    } catch (e) {
      print("from e");
    }
  }

  Stream<FeedState> _mapFetchFeedToState() async* {
    try {
      print("From fetch");
      yield FeedFetchLoading();

      List<FeedModel> events = await FeedRepository.getFeeds();

      yield FeedFetchSuccess(events: events);
    } on DioError catch (e) {
      print(e);
      yield FeedFetchFailure(
        isNetworkError: true,
        error: "There seems to be a problem with your Network Connection.",
      );
    } catch (e) {
      yield FeedFetchFailure(error: e);
    }
  }
}
