import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/dormitory_bath_facility_response.dart';
import 'package:kostrushapp/data/network/response/dormitory_facility_response.dart';
import 'package:kostrushapp/data/network/response/dormitory_image_response.dart';
import 'package:kostrushapp/data/network/response/dormitory_location_response.dart';
import 'package:kostrushapp/data/network/response/dormitory_price_response.dart';
import 'package:kostrushapp/data/network/response/dormitory_rules_response.dart';

import '../../enum/dorm_gender_enum.dart';
import 'owner_response.dart';

part 'dormitory_response.g.dart';

@JsonSerializable()
class DormitoryResponse {
  final String id;
  final String name;
  final int availableRoom;
  final DormGenderEnum dormitoryGender;
  final String dormitoryType;
  final DormitoryFacilityResponse dormitoryFacility;
  final DormitoryBathFacilityResponse dormitoryBathFacility;
  final DormitoryRulesResponse dormitoryRules;
  final DormitoryLocationResponse dormitoryLocation;
  final List<DormitoryImageResponse> dormitoryImage;
  final DormitoryPriceResponse dormitoryPrice;
  final Owner owner;

  DormitoryResponse({
    required this.id,
    required this.name,
    required this.availableRoom,
    required this.dormitoryGender,
    required this.dormitoryType,
    required this.dormitoryFacility,
    required this.dormitoryBathFacility,
    required this.dormitoryRules,
    required this.dormitoryLocation,
    required this.dormitoryImage,
    required this.dormitoryPrice,
    required this.owner,
  });

  factory DormitoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DormitoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DormitoryResponseToJson(this);
}
