import 'package:json_annotation/json_annotation.dart';

part 'dormitory_location_response.g.dart';

@JsonSerializable()
class DormitoryLocationResponse {
  final String address;
  final double latitude;
  final double longitude;
  final String sublocality;

  DormitoryLocationResponse({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.sublocality,
  });

  factory DormitoryLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$DormitoryLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DormitoryLocationResponseToJson(this);
}
