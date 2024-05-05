import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/dormitory_response.dart';

part 'dashboard_response.g.dart';

@JsonSerializable()
class DashboardResponse {
  final List<DormitoryResponse> recomendedDormitories;
  final List<DormitoryResponse> cheapestDormitories;

  DashboardResponse({
    required this.recomendedDormitories,
    required this.cheapestDormitories,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardResponseToJson(this);
}
