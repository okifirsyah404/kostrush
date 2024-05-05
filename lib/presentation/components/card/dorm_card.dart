import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kostrushapp/data/enum/dorm_gender_enum.dart';
import 'package:kostrushapp/presentation/components/chip/tag_chip.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
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
    required this.imageUrl,
    this.maxImageWidth = 160.0,
    this.onTap,
  }) : super(key: key);

  final String name, address, imageUrl;
  final int price;
  final DormGenderEnum dormGenderEnum;
  final double maxImageWidth;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: maxImageWidth,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
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
                    TagChip.filled(text: dormGenderEnum.value),
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
      ),
    );
  }
}
