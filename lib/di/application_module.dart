import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/di/repository_module.dart';
import 'package:kostrushapp/di/service_module.dart';
import 'package:kostrushapp/di/use_case_module.dart';
import 'package:kostrushapp/utils/extensions/dio_ext.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../res/local_data/storage_constant.dart';
import '../res/remote/remote_constant.dart';
import '../utils/interceptor/auth_header_intercceptor.dart';

/// Fungsi ini digunakan untuk inisialisasi modul aplikasi dengan konsep dependency injection
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

  await Get.putAsync(
    () async => Dio()
        .addBaseUrl(RemoteConstant.baseUrl)
        .addInterceptor(
          PrettyDioLogger(
            request: true,
            requestHeader: true,
            requestBody: true,
            compact: false,
            maxWidth: 300,
            responseHeader: true,
            responseBody: true,
          ),
        )
        .addInterceptor(
          AuthHeaderInterceptor(
            onToken: () async =>
                await Get.find<StoragePreference>()
                    .readSecureData(StorageConstant.sessionToken) ??
                '',
          ),
        ),
  );

  await initServiceModule();
  await initRepositoryModule();
  await initUseCaseModule();
}
