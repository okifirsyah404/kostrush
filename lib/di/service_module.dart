import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/service/auth_service.dart';
import 'package:kostrushapp/data/network/service/main_app_service.dart';

Future<void> initServiceModule() async {
  // Membuat instance AuthService
  await Get.putAsync(() async => AuthService(Get.find<Dio>()));

  // Membuat instance MainAppService
  await Get.putAsync(() async => MainAppService(Get.find<Dio>()));
}
