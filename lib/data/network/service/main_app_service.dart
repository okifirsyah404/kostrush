import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';
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

  @PUT('/api/apieditprofile')
  @FormUrlEncoded()
  Future<void> editProfile(
    @Header('Authorization') String token,
    @Field('name') String name,
    @Field('email') String email,
    @Field('alamat') String address,
    @Field('pekerjaan') String occupation,
    @Field('tgl_lahir') String dateBirth,
    @Field('no_hp') String phoneNumber,
    @Field('jenis_kelamin') String gender, [
    @Header('Accept') String acccept = 'application/json',
  ]);

  @GET('/api/apikost')
  Future<KostResponse> getKost();

  @PUT('/api/apieditpassword')
  @FormUrlEncoded()
  Future<KostResponse> changePassword(
    @Header('Authorization') String token,
    @Field('password') String password,
  );

  @POST('/api/filterkostkecamatan')
  Future<KostResponse> getKostBySubLocality(
    @Field('kecamatan') String subLocality,
  );

  @GET('/api/searchkost')
  Future<KostResponse> searchKost(
    @Query('query') String search,
  );

  @GET('/api/apitransaksi')
  Future<TransactionResponse> getTransaction(
    @Header('Authorization') String token,
  );

  @POST("/api/apiaddtransaksi")
  Future<void> addTransaction({
    @Header('Authorization') required String token,
    @Field('id_kost') required String kostId,
    @Field('id_kamar') required String roomId,
    @Field('biaya') required String totalPrice,
    @Field('tanggal_masuk') required String checkIn,
    @Field('durasi') required String duration,
    @Part(name: 'foto_ktp') required File image,
    @Header('Accept') String acccept = 'application/json',
  });
}
