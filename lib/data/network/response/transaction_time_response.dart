import 'package:json_annotation/json_annotation.dart';

part 'transaction_time_response.g.dart';

@JsonSerializable()
class TransactionTimeResponse {
  final DateTime checkIn;
  final DateTime checkOut;
  final int durationMonth;

  TransactionTimeResponse({
    required this.checkIn,
    required this.checkOut,
    required this.durationMonth,
  });

  factory TransactionTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionTimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionTimeResponseToJson(this);
}
