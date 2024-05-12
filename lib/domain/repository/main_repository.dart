import 'package:dartz/dartz.dart';
import 'package:kostrushapp/data/local/dao/profile_dao.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/model/dashboard_model.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/data/network/service/main_app_service.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';

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
}
