import 'package:dio/dio.dart';
import 'package:task_manager_app/core/utils/logger.dart';

class ErrorHandler {
  static void handleDioException(DioException exception) {
    String errorMessage = 'Unknown error occurred';
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection Timeout';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send Timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive Timeout';
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            'Received invalid status code: ${exception.response?.statusCode}';
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request to API server was cancelled';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Network Error: ${exception.message}';
        break;
      default:
        errorMessage = 'Unexpected error occurred';
    }
    AppLogger.error('Error: $errorMessage');
  }
}
