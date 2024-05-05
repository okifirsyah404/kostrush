import 'package:json_annotation/json_annotation.dart';

part 'dormitory_price_response.g.dart';

@JsonSerializable()
class DormitoryPriceResponse {
  final int price;
  final int depositPrice;

  DormitoryPriceResponse({
    required this.price,
    required this.depositPrice,
  });

  factory DormitoryPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$DormitoryPriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DormitoryPriceResponseToJson(this);
}
