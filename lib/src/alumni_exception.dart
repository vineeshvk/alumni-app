class AlumniException implements Exception {
  final String _message;
  AlumniException(this._message);

  @override
  String toString() => _message ?? "Something went wrong";
}
