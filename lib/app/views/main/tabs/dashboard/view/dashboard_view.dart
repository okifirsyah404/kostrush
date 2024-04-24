import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:kostrushapp/app/components/appbar/dashboard_app_bar.dart';
import 'package:kostrushapp/app/components/card/dorm_card.dart';
import 'package:kostrushapp/app/components/card/location_card.dart';
import 'package:kostrushapp/app/themes/typography_theme.dart';
import 'package:kostrushapp/data/enum/dorm_gender_enum.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../components/focus_node/no_focus_node.dart';
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
                focusNode: NoFocusNode(),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorsTheme.primaryColor,
                ),
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
            style: TypographyTheme.labelMedium,
          ),
          gap(8),
          ExpandChild(
            collapsedVisibilityFactor: 0.25,
            indicatorBuilder: (context, onExpand(), isExpand) {
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
            child: const Wrap(
              alignment: WrapAlignment.center,
              children: [
                LocationCard(
                  name: "Bagor",
                  imagePath: ImageAssetConstant.locBagor,
                ),
                LocationCard(
                  name: "Baron",
                  imagePath: ImageAssetConstant.locBaron,
                ),
                LocationCard(
                  name: "Brebek",
                  imagePath: ImageAssetConstant.locBrebek,
                ),
                LocationCard(
                  name: "Gondang",
                  imagePath: ImageAssetConstant.locGondang,
                ),
                LocationCard(
                  name: "Jatikalen",
                  imagePath: ImageAssetConstant.locJatikalen,
                ),
                LocationCard(
                  name: "Kertosono",
                  imagePath: ImageAssetConstant.locKertosono,
                ),
                LocationCard(
                  name: "Lengkong",
                  imagePath: ImageAssetConstant.locLengkong,
                ),
                LocationCard(
                  name: "Loceret",
                  imagePath: ImageAssetConstant.locLoceret,
                ),
                LocationCard(
                  name: "Nganjuk",
                  imagePath: ImageAssetConstant.locNganjuk,
                ),
                LocationCard(
                  name: "Ngetos",
                  imagePath: ImageAssetConstant.locNgetos,
                ),
                LocationCard(
                  name: "Ngronggot",
                  imagePath: ImageAssetConstant.locNgronggot,
                ),
                LocationCard(
                  name: "Pace",
                  imagePath: ImageAssetConstant.locPace,
                ),
                LocationCard(
                  name: "Patianrowo",
                  imagePath: ImageAssetConstant.locPatianrowo,
                ),
                LocationCard(
                  name: "Prambon",
                  imagePath: ImageAssetConstant.locPrambon,
                ),
                LocationCard(
                  name: "Rejoso",
                  imagePath: ImageAssetConstant.locRejoso,
                ),
                LocationCard(
                  name: "Sawahan",
                  imagePath: ImageAssetConstant.locSawahan,
                ),
                LocationCard(
                  name: "Sukomoro",
                  imagePath: ImageAssetConstant.locSukomoro,
                ),
                LocationCard(
                  name: "Tanjung Anom",
                  imagePath: ImageAssetConstant.locTanjungAnom,
                ),
                LocationCard(
                  name: "Wilangan",
                  imagePath: ImageAssetConstant.locWilangan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _popularBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Kost Populer",
              style: TypographyTheme.labelMedium,
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
              // Add spacing between items
              itemBuilder: (context, index) {
                return DormCard(
                  dormGenderEnum: DormGenderEnum.MALE,
                  price: (index + 1) * 100000,
                  name: "Kost Pak Agung ${index + 1}",
                  address: "Jl. Raya Nganjuk No. ${index + 1}",
                );
              },
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Kost Termurah",
              style: TypographyTheme.labelMedium,
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
              // Add spacing between items
              itemBuilder: (context, index) {
                return DormCard(
                  dormGenderEnum: DormGenderEnum.FEMALE,
                  price: (index + 1) * 100000,
                  name: "Kost Bu Sani ${index + 1}",
                  address: "Jl. Raya Nganjuk No. ${index + 1}",
                );
              },
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
