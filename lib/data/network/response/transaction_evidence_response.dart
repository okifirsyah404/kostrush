import 'package:json_annotation/json_annotation.dart';

part 'transaction_evidence_response.g.dart';

@JsonSerializable()
class TransactionEvidenceResponse {
  final String url;

  TransactionEvidenceResponse({
    required this.url,
  });

  factory TransactionEvidenceResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionEvidenceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionEvidenceResponseToJson(this);
}
