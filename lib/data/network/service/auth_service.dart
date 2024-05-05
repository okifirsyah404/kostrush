import 'package:dio/dio.dart';
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/network/request/sign_in_request.dart';
import 'package:kostrushapp/data/network/response/auth_response.dart';
import 'package:kostrushapp/res/remote/remote_constant.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(RemoteConstant.signIn)
  Future<BaseResponse<AuthResponse>> login(@Body() SignInRequest request);
}
