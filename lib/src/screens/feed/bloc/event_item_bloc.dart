import 'package:alumni_app/src/models/event_model.dart';
import 'package:alumni_app/src/screens/feed/bloc/event_item_event.dart';
import 'package:alumni_app/src/screens/feed/bloc/event_item_repository.dart';
import 'package:alumni_app/src/screens/feed/bloc/event_item_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventItemBloc extends Bloc<EventItemEvent, EventItemState> {
  @override
  EventItemState get initialState => EventItemInitiated();

  @override
  Stream<EventItemState> mapEventToState(EventItemEvent event) async* {
    try {
      if (event is FetchEventItems) {
        yield* _mapFetchEventItemToState();
      }
    } catch (e) {
      print("from e");
    }
  }

  Stream<EventItemState> _mapFetchEventItemToState() async* {
    try {
      print("From fetch");
      yield EventItemFetchLoading();

      List<EventItemModel> events = await EventItemRepository.getEvents();

      yield EventItemFetchSuccess(events: events);
    } on DioError catch (e) {
      print(e);
      yield EventItemFetchFailure(
        isNetworkError: true,
        error: "There seems to be a problem with your Network Connection.",
      );
    } catch (e) {
      yield EventItemFetchFailure(error: e);
    }
  }
}
