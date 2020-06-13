const API_URL = "http://alumniii.herokuapp.com";

mixin API_ENDPOINTS {
  static final login = "/alumni/login";
  static final getAlumni = "/alumni/getalumni";
  static final register = "/alumni/register";
  static final emailExist = "/alumni/emailAlreadyExists";
  static final getEvents = "/event/getEvents";
  static final deleteEvent = "/event/deleteEvent";
  static final addEvent = "/event/addEvent";
}
