import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kostrushapp/app/themes/typography_theme.dart';

/// Class ini digunakan untuk membuat card lokasi pada dashboard
class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.name, required this.imagePath});

  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Gap(4),
          Text(
            name,
            style: TypographyTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
