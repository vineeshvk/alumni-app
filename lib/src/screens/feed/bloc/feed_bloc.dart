import 'package:alumni_app/src/models/event_model.dart';
import 'package:alumni_app/src/respositories/feed_respository.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_event.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitialState());

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
      yield FeedFetchLoadingState();

      List<FeedModel> events = await FeedRepository.getFeeds();

      yield FeedFetchSuccessState(events: events);
    } on DioError catch (e) {
      print(e);
      yield FeedFetchFailureState(
        isNetworkError: true,
        error: "There seems to be a problem with your Network Connection.",
      );
    } catch (e) {
      yield FeedFetchFailureState(error: e);
    }
  }
}
