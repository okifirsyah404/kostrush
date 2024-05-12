import 'package:get/get.dart';
import 'package:kostrushapp/domain/repository/auth_repository.dart';

import '../domain/repository/main_repository.dart';

Future<void> initRepositoryModule() async {
  // Membuat instance AuthRepository
  Get.putAsync(
    () async => AuthRepository(
      Get.find(),
      Get.find(),
    ),
  );

  // Membuat instance MainRepository
  Get.putAsync(
    () async => MainRepository(
      Get.find(),
      Get.find(),
      Get.find(),
    ),
  );
}
