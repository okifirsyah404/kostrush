import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/request/sign_in_request.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';

import '../../data/local/share_pref/storage_preference.dart';
import '../../data/network/service/auth_service.dart';

class AuthRepository {
  final _service = Get.find<AuthService>();
  final _storage = Get.find<StoragePreference>();

  Future<Either<DioException, void>> login(
      String email, String password) async {
    try {
      final response = await _service.login(
        SignInRequest(
          email: email,
          password: password,
        ),
      );

      await _storage.writeSecureData(
          StorageConstant.sessionToken, response.data!.token);

      return right(null);
    } on DioException catch (e) {
      return left(e);
    }
  }
}
