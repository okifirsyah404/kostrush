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

  @POST('/api/apiregister')
  Future<void> signUp({
    @Field() required String name,
    @Field() required String email,
    @Field() required String password,
    @Field("alamat") required String address,
    @Field("no_hp") required String phoneNumber,
    @Field("pekerjaan") required String occupation,
    @Field("tgl_lahir") required String dateBirth,
    @Field("jenis_kelamin") required String gender,
  });
}
