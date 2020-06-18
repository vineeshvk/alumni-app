import 'package:alumni_app/src/alumni_exception.dart';
import 'package:alumni_app/src/models/event_model.dart';
import 'package:alumni_app/src/utils/api_endpoints.dart';
import 'package:alumni_app/src/utils/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class FeedRepository {


  static Future<List<FeedModel>> getFeeds() async {
    List<FeedModel> feeds;

    Response res = await dio.get(API_BASE_URL + APIEndpoints.getEvents);

    if (res.data["error"] == null) {
      List ev = res.data["events"];
      feeds = ev.map((e) => FeedModel.fromJson(e)).toList();
    } else
      throw new AlumniException(res.data["error"]);

    return feeds;
  }

  static  Future<FeedModel> deleteFeed({@required String eventId}) async {
    FeedModel feed;

    Response res = await dio.delete(
      API_BASE_URL + APIEndpoints.deleteEvent,
      data: {"eventId": eventId},
    );

    if (res.data["error"] == null) {
      feed = FeedModel.fromJson(res.data["event"]);
    } else
      throw new AlumniException(res.data["error"]);

    return feed;
  }

 static Future<FeedModel> addFeed({@required FeedModel eventInput}) async {
    FeedModel feed;

    Response res = await dio.post(
      API_BASE_URL + APIEndpoints.addEvent,
      data: eventInput.toJson(),
    );

    if (res.data["error"] == null) {
      feed = FeedModel.fromJson(res.data["event"]);
    } else
      throw new AlumniException(res.data["error"]);

    return feed;
  }
}