import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/di/repository_module.dart';
import 'package:kostrushapp/di/service_module.dart';
import 'package:kostrushapp/di/use_case_module.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Class ini digunakan untuk inisialisasi modul aplikasi dengan konsep dependency injection
Future<void> initApplicationModule() async {
  await Get.putAsync<Logger>(
    () async => Logger(),
  );

  await Get.putAsync(() async => const FlutterSecureStorage());

  await Get.putAsync(
    () async => StoragePreference(
      Get.find<FlutterSecureStorage>(),
      Get.find<Logger>(),
    ),
  );

  await Get.putAsync(() async => PackageInfo.fromPlatform());

  await initServiceModule();
  await initRepositoryModule();
  await initUseCaseModule();
}
