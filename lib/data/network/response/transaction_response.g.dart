// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) =>
    TransactionResponse(
      id: json['id'] as String,
      totalPrice: json['totalPrice'] as int,
      status: $enumDecode(_$TransactionStatusEnumEnumMap, json['status']),
      transactionTime: TransactionTimeResponse.fromJson(
          json['transactionTime'] as Map<String, dynamic>),
      transactionEvidence: TransactionEvidenceResponse.fromJson(
          json['transactionEvidence'] as Map<String, dynamic>),
      dormitory:
          DormitoryResponse.fromJson(json['dormitory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalPrice': instance.totalPrice,
      'status': _$TransactionStatusEnumEnumMap[instance.status]!,
      'transactionTime': instance.transactionTime,
      'transactionEvidence': instance.transactionEvidence,
      'dormitory': instance.dormitory,
    };

const _$TransactionStatusEnumEnumMap = {
  TransactionStatusEnum.pending: 'PENDING',
  TransactionStatusEnum.processing: 'PROCESSING',
  TransactionStatusEnum.done: 'DONE',
};
