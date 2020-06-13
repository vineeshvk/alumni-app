class EventItemModel {
  String id;
  String title;
  String description;
  String image;
  String createTime;
  String contact;
  String venue;
  String scheduledDate;

  EventItemModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createTime,
    this.contact,
    this.venue,
    this.scheduledDate,
  });

  factory EventItemModel.fromJson(Map json) {
    return EventItemModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
      createTime: json["createTime"],
      contact: json["contact"],
      venue: json["venue"],
      scheduledDate: json["scheduledDate"],
    );
  }

  Map<String, String> toJson() {
    final eventFeed = {
      "id": id,
      "title": title,
      "description": description,
      "image": image,
      "createTime": createTime,
      "contact": contact,
      "venue": venue,
      "scheduledDate": scheduledDate,
    };
    return eventFeed;
  }
}
