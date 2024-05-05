import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/service/auth_service.dart';
import 'package:kostrushapp/data/network/service/dormitory_service.dart';
import 'package:kostrushapp/data/network/service/main_service.dart';

Future<void> initServiceModule() async {
  await Get.putAsync(() async => AuthService(Get.find<Dio>()));
  await Get.putAsync(() async => MainService(Get.find<Dio>()));
  await Get.putAsync(() async => DormitoryService(Get.find<Dio>()));
}
