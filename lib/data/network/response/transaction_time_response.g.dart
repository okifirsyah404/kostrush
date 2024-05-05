// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionTimeResponse _$TransactionTimeResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionTimeResponse(
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
      durationMonth: json['durationMonth'] as int,
    );

Map<String, dynamic> _$TransactionTimeResponseToJson(
        TransactionTimeResponse instance) =>
    <String, dynamic>{
      'checkIn': instance.checkIn.toIso8601String(),
      'checkOut': instance.checkOut.toIso8601String(),
      'durationMonth': instance.durationMonth,
    };
