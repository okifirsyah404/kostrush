import 'dart:math';

import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:kostrushapp/data/enum/dorm_gender_enum.dart';
import 'package:kostrushapp/presentation/components/appbar/dashboard_app_bar.dart';
import 'package:kostrushapp/presentation/components/card/dorm_card.dart';
import 'package:kostrushapp/presentation/components/card/location_card.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/res/remote/remote_constant.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../components/input/main_text_input.dart';
import '../../../../../themes/color_theme.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends BaseView<DashboardController> {
  const DashboardView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DashboardAppBar();
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MainTextInput(
                controller: controller.searchController,
                hintText: "Cari Kost",
                focusNode: controller.noFocusNode,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorsTheme.primaryColor,
                ),
                onContainerTap: () {
                  controller.navigateToSearch();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _locationBuilder(),
          ),
          SliverToBoxAdapter(
            child: _popularBuilder(),
          ),
          SliverToBoxAdapter(
            child: _recommendedBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _locationBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Lokasi Terdekat",
            style: TypographyTheme.labelLarge,
          ),
          gap(8),
          ExpandChild(
            collapsedVisibilityFactor: 0.25,
            indicatorBuilder: (context, Function() onExpand, isExpand) {
              return InkWell(
                onTap: onExpand,
                splashFactory: NoSplash.splashFactory,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.center,
                  child: Text(
                    isExpand ? "Tutup" : "Lihat Semua",
                    style: TypographyTheme.labelSmall.copyWith(
                      color: ColorsTheme.primaryColor,
                    ),
                  ),
                ),
              );
            },
            child: Wrap(
              alignment: WrapAlignment.center,
              children: controller.locationList.asMap().entries.map((entry) {
                final int index = entry.key;
                final Map<String, String> element = entry.value;
                return LocationCard(
                  name: element["name"] ?? "",
                  imagePath: element["imagePath"] ?? "",
                  onTap: () {
                    controller.navigateToLocationResult(index);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _popularBuilder() {
    final random = Random();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kost Populer",
                  style: TypographyTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {
                    controller.navigateToPopularDormitory();
                  },
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    "Lihat Semua",
                  ),
                )
              ],
            ),
          ),
          gap(8),
          Container(
            height: 240,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              separatorBuilder: (context, index) => SizedBox(width: 8.0),
              itemCount: controller.state?.recomendedDormitories.length ?? 0,
              itemBuilder: (context, index) {
                return DormCard(
                  dormGenderEnum: controller.state?.recomendedDormitories[index]
                          .dormitoryGender ??
                      DormGenderEnum.UNISEX,
                  price: controller.state?.recomendedDormitories[index]
                          .dormitoryPrice.price ??
                      0,
                  name:
                      controller.state?.recomendedDormitories[index].name ?? "",
                  address: controller.state?.recomendedDormitories[index]
                          .dormitoryLocation.address ??
                      "",
                  imageUrl:
                      "${RemoteConstant.baseUrl}${controller.state?.recomendedDormitories[index].dormitoryImage[random.nextInt(3)].url}",
                  onTap: () {
                    controller.navigateToDetailDormitory(
                        controller.state?.recomendedDormitories[index].id ??
                            "");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedBuilder() {
    final random = Random();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kost Termurah",
                  style: TypographyTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {
                    controller.navigateToCheapDormitory();
                  },
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    "Lihat Semua",
                  ),
                )
              ],
            ),
          ),
          gap(8),
          Container(
            height: 240,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              separatorBuilder: (context, index) => SizedBox(width: 8.0),
              itemCount: controller.state?.cheapestDormitories.length ?? 0,
              itemBuilder: (context, index) {
                return DormCard(
                  dormGenderEnum: controller
                          .state?.cheapestDormitories[index].dormitoryGender ??
                      DormGenderEnum.UNISEX,
                  price: controller.state?.cheapestDormitories[index]
                          .dormitoryPrice.price ??
                      0,
                  name: controller.state?.cheapestDormitories[index].name ?? "",
                  address: controller.state?.cheapestDormitories[index]
                          .dormitoryLocation.address ??
                      "",
                  imageUrl:
                      "${RemoteConstant.baseUrl}${controller.state?.cheapestDormitories[index].dormitoryImage[random.nextInt(3)].url}",
                  onTap: () {
                    controller.navigateToDetailDormitory(
                        controller.state?.cheapestDormitories[index].id ?? "");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
