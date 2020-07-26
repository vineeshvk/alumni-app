class CollegeModel {
  final String id;
  final String name;

  CollegeModel({this.id, this.name});

  factory CollegeModel.fromJson(Map json) {
    return CollegeModel(id: json["id"], name: json["name"]);
  }
}
