import 'package:json_annotation/json_annotation.dart';

part 'dormitory_facility_response.g.dart';

@JsonSerializable()
class DormitoryFacilityResponse {
  final bool airConditioner;
  final bool bathroom;
  final bool bed;
  final bool pillow;
  final int? roomHeight;
  final int roomLength;
  final int roomWidth;
  final bool wardrobe;
  final bool wifi;

  DormitoryFacilityResponse({
    required this.airConditioner,
    required this.bathroom,
    required this.bed,
    required this.pillow,
    this.roomHeight,
    required this.roomLength,
    required this.roomWidth,
    required this.wardrobe,
    required this.wifi,
  });

  factory DormitoryFacilityResponse.fromJson(Map<String, dynamic> json) =>
      _$DormitoryFacilityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DormitoryFacilityResponseToJson(this);
}
