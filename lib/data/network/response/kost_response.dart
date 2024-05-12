import 'package:json_annotation/json_annotation.dart';

part 'kost_response.g.dart';

@JsonSerializable()
class KostResponse {
  final List<Kost>? kosts;

  KostResponse({
    this.kosts,
  });

  factory KostResponse.fromJson(Map<String, dynamic> json) =>
      _$KostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KostResponseToJson(this);
}

class Kost {
  @JsonKey(name: 'id_kost')
  final int? id;
  @JsonKey(name: 'nama_kost')
  final String? name;
  @JsonKey(name: 'alamat')
  final String? address;
  @JsonKey(name: 'kecamatan')
  final String? subLocality;
  @JsonKey(name: 'peraturan')
  final String? rules;
  @JsonKey(name: 'fasilitas')
  final String? facilities;
  @JsonKey(name: 'tipe')
  final String? type;

  Kost({
    this.id,
    this.name,
    this.address,
    this.subLocality,
    this.rules,
    this.facilities,
    this.type,
  });

  factory Kost.fromJson(Map<String, dynamic> json) => Kost(
        id: json['id_kost'],
        name: json['nama_kost'],
        address: json['alamat'],
        subLocality: json['kecamatan'],
        rules: json['peraturan'],
        facilities: json['fasilitas'],
        type: json['tipe'],
      );

  Map<String, dynamic> toJson() => {
        'id_kost': id,
        'nama_kost': name,
        'alamat': address,
        'kecamatan': subLocality,
        'peraturan': rules,
        'fasilitas': facilities,
        'tipe': type,
      };
}
