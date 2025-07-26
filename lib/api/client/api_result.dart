import 'package:dio/dio.dart';
import 'package:photo_gallery_app/utils/exceptions/dio_exceptions.dart';
import 'package:photo_gallery_app/utils/exceptions/response_exception.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class Failure<T> extends Result<T> {
  Failure({required this.errorMessage, this.responseException});
  final String errorMessage;
  final ResponseException? responseException;
}

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    final data = await apiCall();
    return Success(data);
  } on DioException catch (error) {
    return Failure(
      errorMessage: DioExceptions.handleError(error).errorMessage,
      responseException: DioExceptions.handleError(error).responseException,
    );
  }
}
