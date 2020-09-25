class User {
  String id;
  String email;
  String dob;
  String password;
  String name;
  String phone;
  String gender;
  String collegeId;
  String registerNo;
  String batch;
  String major;
  String degree;
  bool admin;

  User(
      {this.id,
      this.email,
      this.dob,
      this.password,
      this.name,
      this.phone,
      this.gender,
      this.collegeId,
      this.registerNo,
      this.batch,
      this.major,
      this.admin,
      this.degree});

  factory User.fromJson(Map json) {
    if (json != null)
      return User(
        id: json['id'],
        email: json['email'],
        dob: json['dob'],
        password: json['password'],
        name: json['name'],
        phone: json['phone'],
        gender: json['gender'],
        collegeId: json['collegeId'],
        registerNo: json['registerNo'],
        batch: json['batch'],
        major: json['major'],
        degree: json['degree'],
        admin: json['admin'],

      );
    return null;
  }

  Map<String, String> toJson() {
    final inputs = {
      "email": email,
      "dob": dob,
      "password": password,
      "name": name,
      "phone": phone,
      "gender": gender,
      "collegeId": collegeId,
      "registerNo": registerNo,
      "batch": batch,
      "major": major,
      "degree": degree,
      "admin": admin
    };
    return inputs;
  }
}
