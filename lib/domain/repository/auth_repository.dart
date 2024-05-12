import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/network/response/sign_in_response.dart';
import 'package:kostrushapp/data/network/service/auth_service.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';

class AuthRepository {
  AuthRepository(this._service, this._storage);

  final AuthService _service;
  final StoragePreference _storage;

  Future<Either<DioException, SignInResponse>> signIn(
      {required String email, required String password}) async {
    try {
      /// Mengirim request ke server untuk sign in
      final response = await _service.signIn(email, password);

      /// Menyimpan token ke SharedPreference
      await _storage.writeSecureData(
          StorageConstant.sessionToken, response.token ?? "");

      /// Mengembalikan response
      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, void>> signOut() async {
    try {
      /// Mengabil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk sign out
      final response = await _service.signOut("Bearer $token");

      /// Menghapus token dari SharedPreference
      await _storage.deleteSecureData(StorageConstant.sessionToken);

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
