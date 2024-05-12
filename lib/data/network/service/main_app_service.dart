import 'package:dio/dio.dart' hide Headers;
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:retrofit/http.dart';

import '../response/kost_response.dart';

part 'main_app_service.g.dart';

@RestApi()
abstract class MainAppService {
  factory MainAppService(Dio dio) = _MainAppService;

  @GET('/api/apigetprofile')
  Future<ProfileResponse> getProfile(
    @Header('Authorization') String token,
  );

  @GET('/api/apikost')
  Future<KostResponse> getKost();

  @POST('/api/filterkostkecamatan')
  Future<KostResponse> getKostBySubLocality(
    @Field('kecamatan') String subLocality,
  );
}
