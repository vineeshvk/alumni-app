import 'package:alumni_app/src/events/bloc/event_item_event.dart';
import 'package:alumni_app/src/events/bloc/event_item_repository.dart';
import 'package:alumni_app/src/events/bloc/event_item_state.dart';
import 'package:alumni_app/src/events/models/event_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class EventItemBloc extends Bloc<EventItemEvent, EventItemState> {
  final EventItemRepository eventRepo;

  EventItemBloc({@required this.eventRepo});

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
      yield EventItemFetchLoading();

      List<EventItemModel> events = await eventRepo.getEvents();

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
