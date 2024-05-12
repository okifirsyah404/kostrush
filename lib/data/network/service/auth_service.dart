import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../response/sign_in_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('/api/apilogin')
  Future<SignInResponse> signIn(
    @Field() String email,
    @Field() String password,
  );

  @POST('/api/apilogout')
  Future<void> signOut(
    @Header('Authorization') String token,
  );
}
