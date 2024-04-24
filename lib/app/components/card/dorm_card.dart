import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kostrushapp/app/themes/color_theme.dart';
import 'package:kostrushapp/app/themes/typography_theme.dart';
import 'package:kostrushapp/data/enum/dorm_gender_enum.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';
import 'package:kostrushapp/utils/extensions/int_ext.dart';

/// Class ini digunakan untuk membuat card kos-kosan
class DormCard extends StatelessWidget {
  const DormCard({
    Key? key,
    required this.dormGenderEnum,
    required this.name,
    required this.address,
    required this.price,
  }) : super(key: key);

  final String name, address;
  final int price;
  final DormGenderEnum dormGenderEnum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          width: 160,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              "assets/images/kost1.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Center(
                      child: Text(
                        dormGenderEnum.value,
                        style: TypographyTheme.bodySmall.copyWith(
                          color: ColorsTheme.neutralColor[1000],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(4),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(4),
              Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TypographyTheme.bodySmall,
              ),
              const Gap(4),
              Text(
                price.toRupiah() + " / Bulan",
                style: TypographyTheme.bodySmall,
              ),
            ],
          ),
        ),
        const Gap(8),
      ],
    );
  }
}
