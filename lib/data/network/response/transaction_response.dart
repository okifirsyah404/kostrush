import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse {
  final List<Transaction>? transaksis;

  TransactionResponse({
    this.transaksis,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: 'id_transaksi')
  final int? idTransaksi;
  @JsonKey(name: 'id_kost')
  final int? idKost;
  @JsonKey(name: 'id_kamar')
  final int? idKamar;
  final int? biaya;
  @JsonKey(name: 'tanggal_masuk')
  final DateTime? tanggalMasuk;
  @JsonKey(name: 'tanggal_keluar')
  final DateTime? tanggalKeluar;
  @JsonKey(name: 'status_transaksi')
  final TransactionStatusEnum? statusTransaksi;
  @JsonKey(name: 'nama_kamar')
  final String? namaKamar;
  @JsonKey(name: 'nama_kost')
  final String? namaKost;

  Transaction({
    this.idTransaksi,
    this.idKost,
    this.idKamar,
    this.biaya,
    this.tanggalMasuk,
    this.tanggalKeluar,
    this.statusTransaksi,
    this.namaKamar,
    this.namaKost,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
