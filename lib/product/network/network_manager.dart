import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'interceptor/auth_interceptor.dart';

final class NetworkManager {
  NetworkManager._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(dio: _dio),
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        logPrint: (o) => logger.d(o),
      ),
    ]);
  }
  static final NetworkManager instance = NetworkManager._();

  static const String _baseUrl = 'https://stage-api.soty.io/Mobile/v1/';

  late final Dio _dio;

  Dio get dio => _dio;

  final Logger logger = Logger();
}
