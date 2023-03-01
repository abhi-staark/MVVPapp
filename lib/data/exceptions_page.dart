class AppExceptions implements Exception {
  // parent class crreation
  final message;
  final prefix;

  AppExceptions(
    // controstructors creation
    //it takes an array in
    this.message,
    this.prefix,
  );

  // creating an string function that returns a string which inludes prefix
  //(default message and a message attached to it)
  @override
  String toString() {
    final x = '$prefix $message';
    return x;
  }
}

//a child class creation
class InternetException extends AppExceptions {
  InternetException(String? message) : super(message, "No Internet");
}

class ServerException extends AppExceptions {
  ServerException(String? message) : super(message, " server connection eror");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut(String? message) : super(message, "Time Out");
}

class InvalidUrl extends AppExceptions {
  InvalidUrl(String? message) : super(message, " Invalid Url");
}

class FetchDataException extends AppExceptions {
  FetchDataException(String? message)
      : super(message, " Error while fetching data");
}
