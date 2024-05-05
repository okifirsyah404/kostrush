import 'package:get/get.dart';
import 'package:kostrushapp/domain/repository/auth_repository.dart';
import 'package:kostrushapp/domain/repository/main_repository.dart';

Future<void> initRepositoryModule() async {
  await Get.putAsync(() async => MainRepository());
  await Get.putAsync(() async => AuthRepository());
}
