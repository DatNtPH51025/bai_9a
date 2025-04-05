import 'dart:io';

import 'package:bai_9a/config_client/app_interceptor.dart';
import 'package:dio/dio.dart';

class AppClient {
  AppClient._();

  static AppClient? _instance;

  static AppClient get instance {
    if (_instance != null) {
      return _instance ?? AppClient._();
    } else {
      _instance = AppClient._();
      return _instance ?? AppClient._();
    }
  }

  late Dio dio;

  Future<void> initNetwork() async {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 35000,
      receiveTimeout: 35000,
      baseUrl: 'AppConst.baseUrl',
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
    );
    dio = await Dio(baseOptions)
      ..interceptors.add(AppInterceptors());

    ///..interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true))
    /// co the se dung den, cu them cho chac
    (dio.httpClientAdapter as dynamic).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}
