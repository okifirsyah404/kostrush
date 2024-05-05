import 'package:dio/dio.dart';
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/network/response/dashboard_response.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';
import 'package:kostrushapp/data/network/response/user_profile_response.dart';
import 'package:kostrushapp/res/remote/remote_constant.dart';
import 'package:retrofit/http.dart';

part 'main_service.g.dart';

@RestApi()
abstract class MainService {
  factory MainService(Dio dio) = _MainService;

  @GET(RemoteConstant.dashboard)
  Future<BaseResponse<DashboardResponse>> fetchDashboard();

  @GET(RemoteConstant.transaction)
  Future<BaseResponse<List<TransactionResponse>>> fetchTransaction();

  @GET(RemoteConstant.profile)
  Future<BaseResponse<UserProfileResponse>> fetchProfile();
}
