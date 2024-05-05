// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dormitory_rules_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormitoryRulesResponse _$DormitoryRulesResponseFromJson(
        Map<String, dynamic> json) =>
    DormitoryRulesResponse(
      isCoupleAllowed: json['isCoupleAllowed'] as bool,
      isGuestAllowed: json['isGuestAllowed'] as bool,
      isGuestOtherGenderAllowed: json['isGuestOtherGenderAllowed'] as bool,
      isPetAllowed: json['isPetAllowed'] as bool,
      isSmokingAllowed: json['isSmokingAllowed'] as bool,
      maxGuestVisitTime: DateTime.parse(json['maxGuestVisitTime'] as String),
      maxPeople: json['maxPeople'] as int,
    );

Map<String, dynamic> _$DormitoryRulesResponseToJson(
        DormitoryRulesResponse instance) =>
    <String, dynamic>{
      'isCoupleAllowed': instance.isCoupleAllowed,
      'isGuestAllowed': instance.isGuestAllowed,
      'isGuestOtherGenderAllowed': instance.isGuestOtherGenderAllowed,
      'isPetAllowed': instance.isPetAllowed,
      'isSmokingAllowed': instance.isSmokingAllowed,
      'maxGuestVisitTime': instance.maxGuestVisitTime.toIso8601String(),
      'maxPeople': instance.maxPeople,
    };
