import 'package:kostrushapp/data/enum/dorm_gender_enum.dart';

/// Extension ini digunakan untuk memperluas fungsionalitas dari [DormGenderEnum]
extension DormGenderEnumExtension on DormGenderEnum {
  /// Mengubah [DormGenderEnum] menjadi [String]
  String get value {
    switch (this) {
      case DormGenderEnum.MALE:
        return "Putra";
      case DormGenderEnum.FEMALE:
        return "Putri";
      case DormGenderEnum.UNISEX:
        return "Campur";
    }
  }
}
