import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/data/local/dao/profile_dao.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/model/dashboard_model.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:kostrushapp/data/network/service/main_app_service.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';

import '../../data/network/response/kost_response.dart';
import '../../data/network/response/transaction_response.dart';

class MainRepository {
  MainRepository(this._service, this._storage, this._profileDao);

  final MainAppService _service;
  final StoragePreference _storage;
  final ProfileDao _profileDao;

  Future<Either<Exception, ProfileModel>> getProfile() async {
    try {
      /// Mengabil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk mendapatkan data profile
      final response =
          await _service.getProfile("Bearer $token").catchError((e) {
        throw Exception(e);
      });

      final data = response.data;

      /// Menyimpan data profile ke local database
      await _profileDao.insertProfile(
        ProfileModel(
          id: 1,
          name: data?.name ?? "",
          email: data?.email ?? "",
          address: data?.address ?? "",
          phoneNumber: data?.phoneNumber ?? "",
          dateBirth: data?.dateBirth,
          gender: data?.gender?.value,
          occupation: data?.occupation ?? "",
        ),
      );

      /// Mengambil data profile dari local database
      final localData = await _profileDao.getProfile().catchError((e) {
        throw Exception(e);
      });

      return Right(localData!);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> editProfile(
      ProfileResponseData profile) async {
    try {
      /// Mengambil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengambil data profile dari local database
      final dbProfile = await _profileDao.getProfile().catchError((e) {
        throw Exception(e);
      });

      /// Mengirim request ke server untuk mengedit data profile
      final response = await _service
          .editProfile(
        "Bearer $token",
        profile.name ?? dbProfile?.name ?? "",
        profile.email ?? dbProfile?.email ?? "",
        profile.address ?? dbProfile?.address ?? "",
        profile.occupation ?? dbProfile?.occupation ?? "",
        (profile.dateBirth ?? dbProfile?.dateBirth ?? DateTime.now())
            .toIso8601String(),
        profile.phoneNumber ?? dbProfile?.phoneNumber ?? "",
        profile.gender?.value ?? dbProfile?.gender ?? "perempuan",
      )
          .catchError((e) {
        throw Exception(e);
      });

      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> changePassword(String password) async {
    try {
      /// Mengambil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk mengedit data profile
      final response = await _service.changePassword(
        "Bearer $token",
        password,
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, DashboardModel>> getDashboard() async {
    try {
      /// Mengambil data kost dari server
      final recommendedKost = await _service.getKost().catchError((e) {
        throw Exception(e);
      });

      /// Mengambil data kost dari server
      final cheapKost = await _service.getKost().catchError((e) {
        throw Exception(e);
      });

      return Right(DashboardModel(
        recommendedKost: recommendedKost,
        cheapKost: cheapKost,
      ));
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, KostResponse>> getRecommendedKost() async {
    try {
      /// Mengambil data kost dari server
      final response = await _service.getKost().catchError((e) {
        throw Exception(e);
      });

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, KostResponse>> getCheapKost() async {
    try {
      /// Mengambil data kost dari server
      final response = await _service.getKost().catchError((e) {
        throw Exception(e);
      });

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, KostResponse>> getKostBySubLocality(
      String subLocality) async {
    try {
      /// Mengambil data kost dari server
      final response = await _service.getKostBySubLocality(subLocality);

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, KostResponse>> searchKost(String query) async {
    try {
      /// Mengambil data kost dari server
      final response = await _service.searchKost(query);

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, void>> addTransaction({
    required String kostId,
    required String roomId,
    required int price,
    required DateTime date,
    required int duration,
    required File image,
  }) async {
    try {
      /// Mengambil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      final response = await _service.addTransaction(
        kostId: kostId,
        roomId: roomId,
        totalPrice: price.toString(),
        checkIn: date.toIso8601String(),
        duration: duration.toString(),
        image: image,
        token: "Bearer $token",
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, TransactionResponse>> getTransaction() async {
    try {
      /// Mengambil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      final response = await _service.getTransaction("Bearer $token");

      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
