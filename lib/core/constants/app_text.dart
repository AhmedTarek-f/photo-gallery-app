abstract final class AppText {
  // Validations
  static const String connectionValidation =
      "You are currently offline, please check your internet connection";

  //Exceptions
  static const String noResponseReceivedMessage =
      "No response received or response is not in expected format.";
  static const String error = "Error";
  static const String unexpectedError = "Unexpected error:";
  static const String unexpectedErrorOccurred = "Unexpected error occurred.";
  static const String requestCancelled = "Request was cancelled.";
  static const String receiveTimeout =
      "Receive timeout, please try again later.";
  static const String sendTimeout = "Send timeout, please try again later.";
  static const String connectionTimeout =
      "Connection timeout, please try again later.";
  static const String networkError =
      "Something went wrong. Please check your internet connection.";
  static const String anUnknownErrorOccurred = "An unknown error occurred.";
  static const String internalServerError =
      "Internal server error, try again later.";
  static const String validationError = "Validation Error.";
  static const String resourceNotFound = "Resource not found.";
  static const String forbidden = "Forbidden, you do not have permission.";
  static const String unauthorized =
      "Unauthorized, please check your credentials.";
  static const String badRequest = "Bad request, please check your input.";
  static const String manyRequests = "Too Many Requests";
}
