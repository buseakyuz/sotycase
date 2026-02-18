import 'package:dio/dio.dart';
import '../../../models/base/base_response.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<BaseResponse<dynamic>> signIn(Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(
        'Auth/SignIn',
        data: body,
      );
      // Since we have a generic BaseResponse, we need to handle the T type manually.
      // For signIn, the responseData is dynamic (or a TokenModel map).
      return BaseResponse.fromJson(response.data, (json) => json);
    } catch (e) {
      // It's better to rethrow and let the repository/interceptor handle it.
      rethrow;
    }
  }
}
