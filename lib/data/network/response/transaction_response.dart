import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';
import 'package:kostrushapp/data/network/response/transaction_evidence_response.dart';
import 'package:kostrushapp/data/network/response/transaction_time_response.dart';

import 'dormitory_response.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse {
  final String id;
  final int totalPrice;
  final TransactionStatusEnum status;
  final TransactionTimeResponse transactionTime;
  final TransactionEvidenceResponse transactionEvidence;
  final DormitoryResponse dormitory;

  TransactionResponse({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.transactionTime,
    required this.transactionEvidence,
    required this.dormitory,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}
