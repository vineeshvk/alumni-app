class RegisterInputModal {
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

  RegisterInputModal(
      {this.email = "",
      this.dob = "",
      this.password = "",
      this.name = "",
      this.phone = "",
      this.gender,
      this.collegeId = "",
      this.registerNo = "",
      this.batch = "",
      this.major = "",
      this.degree = ""});

  factory RegisterInputModal.fromJson(Map json) {
    return RegisterInputModal(
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
    );
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
      "degree": degree
    };
    return inputs;
  }
}
