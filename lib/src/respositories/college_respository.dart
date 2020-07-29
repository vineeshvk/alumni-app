import 'package:alumni_app/src/alumni_exception.dart';
import 'package:alumni_app/src/models/college_model.dart';
import 'package:alumni_app/src/utils/api_endpoints.dart';
import 'package:alumni_app/src/utils/dio_helper.dart';
import 'package:dio/dio.dart';

class CollegeRespository {
  static Future<List<CollegeModel>> getColleges() async {
    List<CollegeModel> colleges;

    Response res = await dio.get(APIEndpoints.getColleges);

    if (res.data["error"] == null) {
      List collegeRes = res.data["colleges"];
      colleges = collegeRes.map((c) => CollegeModel.fromJson(c)).toList();
    } else
      throw new AlumniException(res.data["error"]);

    return colleges;
  }

  static Future<CollegeModel> addCollege({String name}) async {
    CollegeModel college;

    Response res = await dio.post(
      APIEndpoints.addCollege,
      data: {"name": name},
    );

    if (res.data["error"] == null) {
      college = res.data["college"];
    } else
      throw new AlumniException(res.data["error"]);

    return college;
  }
}
