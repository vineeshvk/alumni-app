const API_BASE_URL = "http://alumniii.herokuapp.com";

class APIEndpoints {
  //alumni
  static const login = "/alumni/login";
  static const alumniRegister = "/alumni/register";
  static const adminRegister = "/alumni/register/admin";
  static const approveAlumni = "/alumni/approve";
  static const emailExist = "/alumni/emailexists";
  static const getAlumni = "/alumni";
  static const editAlumni = "/alumni";

  //event
  static const getEvents = "/event";
  static const deleteEvent = "/event";
  static const addEvent = "/event";

  //college
  static const getColleges = "/college";
  static const addCollege = "/college";
  static const deleteColleges = "/college";


}
