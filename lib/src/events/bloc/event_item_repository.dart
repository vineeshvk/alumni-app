import 'package:alumni_app/src/alumni_exception.dart';
import 'package:alumni_app/src/constants/api.dart';
import 'package:alumni_app/src/events/models/event_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class EventItemRepository {
  final Dio dio;

  EventItemRepository({this.dio});

  Future<List<EventItemModel>> getEvents() async {
    List<EventItemModel> events;

    Response res = await dio.get(
      API_URL + API_ENDPOINTS.getEvents,
    );

    if (res.data["error"] == null) {
      List ev = res.data["events"];
      events = ev.map((e) => EventItemModel.fromJson(e)).toList();
    } else
      throw new AlumniException(res.data["error"]);

    return events;
  }

  Future<EventItemModel> deleteEvent({@required String eventId}) async {
    EventItemModel event;

    Response res = await dio.delete(
      API_URL + API_ENDPOINTS.deleteEvent,
      data: {"eventId": eventId},
    );

    if (res.data["error"] == null) {
      event = EventItemModel.fromJson(res.data["event"]);
    } else
      throw new AlumniException(res.data["error"]);

    return event;
  }

  Future<EventItemModel> addEvent({@required EventItemModel eventInput}) async {
    EventItemModel event;

    Response res = await dio.post(
      API_URL + API_ENDPOINTS.addEvent,
      data: eventInput.toJson(),
    );

    if (res.data["error"] == null) {
      event = EventItemModel.fromJson(res.data["event"]);
    } else
      throw new AlumniException(res.data["error"]);

    return event;
  }
}
