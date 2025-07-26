import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_gallery_app/core/constants/app_text.dart';

class ResponseException extends Equatable {
  const ResponseException({required this.status, required this.code});

  final num status;
  final String code;

  static ResponseException empty() => const ResponseException(
    status: 0,
    code: AppText.noResponseReceivedMessage,
  );

  factory ResponseException.handleException({required Response? response}) {
    if (response != null && response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      return ResponseException(
        status: data['status'] ?? 0,
        code: data['code'] ?? AppText.anUnknownErrorOccurred,
      );
    } else {
      return empty();
    }
  }

  @override
  List<Object?> get props => [status, code];
}
