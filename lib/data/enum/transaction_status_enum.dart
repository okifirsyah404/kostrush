import 'package:json_annotation/json_annotation.dart';

enum TransactionStatusEnum {
  @JsonValue('PENDING')
  pending,
  @JsonValue('PROCESSING')
  processing,
  @JsonValue('DONE')
  done,
}
