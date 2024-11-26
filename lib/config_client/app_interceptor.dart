import 'dart:convert';

import 'package:bai_9a/networks/check_connect.dart';
import 'package:bai_9a/ultis/app_logger.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions request, RequestInterceptorHandler handler) async {
    final method = request.method;
    final path = request.path;
    final data = request.data;
    logger.i("Request[$method] => PATH: $path\n DATA: $data");
    request.copyWith(
      headers: {
        "content-length": null,
      },
    );
    CheckConnect.checkConnect().then((value) {
      if (value == true) {
        super.onRequest(request, handler);
      } else {
        print("mat ket noi");
      }
    });
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final path = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    logger.i("Response[$statusCode] => PATH: $path\n DATA: $data");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    final statusCode = error.response?.statusCode;
    final uri = error.requestOptions.path;
    dynamic data = error.response?.data;
    try {
      data = jsonEncode(error.response?.data);
      switch (error.type) {
        case DioErrorType.connectTimeout:
          logger.e("⚠️ ConnectTimeout[$statusCode] => PATH: $uri\n DATA: $data");
          break;
        case DioErrorType.response:
          switch (error.response?.statusCode) {
            case 401:
              logger.e("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
              break;
            case 404:
              logger.e("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
              break;
            case 400:
              logger.e("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
              break;
            case 500:
              logger.e("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
              break;
            case 503:
              logger.e("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
              break;
          }
          break;
        default:
          logger.e("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
          break;
      }
    } catch (e) {
      logger.e(e);
    }
    super.onError(error, handler);
  }
}
