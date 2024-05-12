// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) =>
    TransactionResponse(
      transaksis: (json['transaksis'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'transaksis': instance.transaksis,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      idTransaksi: (json['id_transaksi'] as num?)?.toInt(),
      idKost: (json['id_kost'] as num?)?.toInt(),
      idKamar: (json['id_kamar'] as num?)?.toInt(),
      biaya: (json['biaya'] as num?)?.toInt(),
      tanggalMasuk: json['tanggal_masuk'] == null
          ? null
          : DateTime.parse(json['tanggal_masuk'] as String),
      tanggalKeluar: json['tanggal_keluar'] == null
          ? null
          : DateTime.parse(json['tanggal_keluar'] as String),
      statusTransaksi: $enumDecodeNullable(
          _$TransactionStatusEnumEnumMap, json['status_transaksi']),
      namaKamar: json['nama_kamar'] as String?,
      namaKost: json['nama_kost'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id_transaksi': instance.idTransaksi,
      'id_kost': instance.idKost,
      'id_kamar': instance.idKamar,
      'biaya': instance.biaya,
      'tanggal_masuk': instance.tanggalMasuk?.toIso8601String(),
      'tanggal_keluar': instance.tanggalKeluar?.toIso8601String(),
      'status_transaksi':
          _$TransactionStatusEnumEnumMap[instance.statusTransaksi],
      'nama_kamar': instance.namaKamar,
      'nama_kost': instance.namaKost,
    };

const _$TransactionStatusEnumEnumMap = {
  TransactionStatusEnum.pending: 'menunggu',
  TransactionStatusEnum.processing: 'diproses',
  TransactionStatusEnum.done: 'selesai',
};
