import 'package:json_annotation/json_annotation.dart';

part 'dormitory_rules_response.g.dart';

@JsonSerializable()
class DormitoryRulesResponse {
  final bool isCoupleAllowed;
  final bool isGuestAllowed;
  final bool isGuestOtherGenderAllowed;
  final bool isPetAllowed;
  final bool isSmokingAllowed;
  final DateTime maxGuestVisitTime;
  final int maxPeople;

  DormitoryRulesResponse({
    required this.isCoupleAllowed,
    required this.isGuestAllowed,
    required this.isGuestOtherGenderAllowed,
    required this.isPetAllowed,
    required this.isSmokingAllowed,
    required this.maxGuestVisitTime,
    required this.maxPeople,
  });

  factory DormitoryRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$DormitoryRulesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DormitoryRulesResponseToJson(this);
}
