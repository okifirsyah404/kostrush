import 'package:dio/dio.dart';
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/network/response/dormitory_response.dart';
import 'package:kostrushapp/res/remote/remote_constant.dart';
import 'package:retrofit/http.dart';

part 'dormitory_service.g.dart';

@RestApi()
abstract class DormitoryService {
  factory DormitoryService(Dio dio) = _DormitoryService;

  @GET(RemoteConstant.dormitoryBySubLocality)
  Future<BaseResponse<List<DormitoryResponse>>> fetchDormitoryBySubLocality(
      @Path("location") String location);

  @GET(RemoteConstant.search)
  Future<BaseResponse<List<DormitoryResponse>>> searchDormitory(
      @Query("q") String query);

  @GET(RemoteConstant.dormitoryDetail)
  Future<BaseResponse<DormitoryResponse>> fetchDormitoryById(
      @Path("id") String id);
}
