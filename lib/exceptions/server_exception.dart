abstract class Exception {}

class ServerException extends Exception {
  String error;

  ServerException({required this.error});
}
