import 'package:json_annotation/json_annotation.dart';

part 'dormitory_bath_facility_response.g.dart';

@JsonSerializable()
class DormitoryBathFacilityResponse {
  final bool shower;
  final bool toilet;
  final bool sink;

  DormitoryBathFacilityResponse({
    required this.shower,
    required this.toilet,
    required this.sink,
  });

  factory DormitoryBathFacilityResponse.fromJson(Map<String, dynamic> json) =>
      _$DormitoryBathFacilityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DormitoryBathFacilityResponseToJson(this);
}
