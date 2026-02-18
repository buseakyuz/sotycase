import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../models/base/base_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("Auth/SignIn")
  Future<BaseResponse<dynamic>> signIn(@Body() Map<String, dynamic> body);

  @POST("Auth/Verify")
  Future<BaseResponse<dynamic>> verifyOtp(@Body() Map<String, dynamic> body);
}
