import 'package:alumni_app/src/alumni_exception.dart';
import 'package:alumni_app/src/models/event_model.dart';
import 'package:alumni_app/src/utils/api_endpoints.dart';
import 'package:alumni_app/src/utils/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class EventItemRepository {


  static Future<List<EventItemModel>> getEvents() async {
    List<EventItemModel> events;

    Response res = await dio.get(API_BASE_URL + APIEndpoints.getEvents);

    if (res.data["error"] == null) {
      List ev = res.data["events"];
      events = ev.map((e) => EventItemModel.fromJson(e)).toList();
    } else
      throw new AlumniException(res.data["error"]);

    return events;
  }

  static  Future<EventItemModel> deleteEvent({@required String eventId}) async {
    EventItemModel event;

    Response res = await dio.delete(
      API_BASE_URL + APIEndpoints.deleteEvent,
      data: {"eventId": eventId},
    );

    if (res.data["error"] == null) {
      event = EventItemModel.fromJson(res.data["event"]);
    } else
      throw new AlumniException(res.data["error"]);

    return event;
  }

 static Future<EventItemModel> addEvent({@required EventItemModel eventInput}) async {
    EventItemModel event;

    Response res = await dio.post(
      API_BASE_URL + APIEndpoints.addEvent,
      data: eventInput.toJson(),
    );

    if (res.data["error"] == null) {
      event = EventItemModel.fromJson(res.data["event"]);
    } else
      throw new AlumniException(res.data["error"]);

    return event;
  }
}
