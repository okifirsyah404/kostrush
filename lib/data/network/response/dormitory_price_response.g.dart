// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dormitory_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormitoryPriceResponse _$DormitoryPriceResponseFromJson(
        Map<String, dynamic> json) =>
    DormitoryPriceResponse(
      price: json['price'] as int,
      depositPrice: json['depositPrice'] as int,
    );

Map<String, dynamic> _$DormitoryPriceResponseToJson(
        DormitoryPriceResponse instance) =>
    <String, dynamic>{
      'price': instance.price,
      'depositPrice': instance.depositPrice,
    };
