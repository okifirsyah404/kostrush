import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/dashboard_response.dart';
import 'package:kostrushapp/data/network/response/dormitory_response.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';
import 'package:kostrushapp/data/network/response/user_profile_response.dart';
import 'package:kostrushapp/data/network/service/dormitory_service.dart';
import 'package:kostrushapp/data/network/service/main_service.dart';

class MainRepository {
  final _service = Get.find<MainService>();
  final _dormitoryService = Get.find<DormitoryService>();

  Future<Either<DioException, DashboardResponse>> fetchDashboard() async {
    try {
      final response = await _service.fetchDashboard();
      return right(response.data!);
    } on DioException catch (e) {
      return left(e);
    }
  }

  Future<Either<DioException, List<TransactionResponse>>>
      fetchTransaction() async {
    try {
      final response = await _service.fetchTransaction();
      return right(response.data!);
    } on DioException catch (e) {
      return left(e);
    }
  }

  Future<Either<DioException, UserProfileResponse>> fetchProfile() async {
    try {
      final response = await _service.fetchProfile();
      return right(response.data!);
    } on DioException catch (e) {
      return left(e);
    }
  }

  Future<Either<DioException, List<DormitoryResponse>>>
      fetchDormitoryBySunLocality(String location) async {
    try {
      final response =
          await _dormitoryService.fetchDormitoryBySubLocality(location);
      return right(response.data!);
    } on DioException catch (e) {
      return left(e);
    }
  }

  Future<Either<DioException, List<DormitoryResponse>>> searchDormitory(
      String name) async {
    try {
      final response = await _dormitoryService.searchDormitory(name);
      return right(response.data!);
    } on DioException catch (e) {
      return left(e);
    }
  }

  Future<Either<DioException, DormitoryResponse>> fetchDormitoryDetail(
      String id) async {
    try {
      final response = await _dormitoryService.fetchDormitoryById(id);
      return right(response.data!);
    } on DioException catch (e) {
      return left(e);
    }
  }
}
