import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/components/icon_data/kost_rush_app_icons.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/res/remote/remote_constant.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';
import 'package:kostrushapp/utils/extensions/int_ext.dart';
import 'package:kostrushapp/utils/mixins/custom_sliver_mixin.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/chip/tag_chip.dart';
import '../controller/detail_dormitory_controller.dart';

class DetailDormitoryView extends BaseView<DetailDormitoryController>
    with CustomSliverMixin {
  const DetailDormitoryView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Detail Kost",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _imageBuilder(),
                ),
                SliverToBoxAdapter(
                  child: _overviewBuilder(),
                ),
                sliverDivider(),
                SliverToBoxAdapter(
                  child: _specificationBuilder(),
                ),
                sliverDivider(),
                SliverToBoxAdapter(
                  child: _bathFacilityBuilder(),
                ),
                sliverDivider(),
                SliverToBoxAdapter(
                  child: _rulesBuilder(),
                ),
              ],
            ),
          ),
        ),
        _bottomButtonBuilder(),
      ],
    );
  }

  Widget _imageBuilder() {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: controller.imageList.length,
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return SizedBox(
                height: 240,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl:
                      "${RemoteConstant.baseUrl}${controller.imageList[index]}",
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Positioned.fill(
            bottom: 16,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _iconButtonBuilder(
                      onTap: () {
                        controller.previousPage();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: controller.currentIndex.value > 0
                            ? ColorsTheme.neutralColor[1000]
                            : ColorsTheme.primaryColor,
                      ),
                      backgroundColor: controller.currentIndex.value > 0
                          ? ColorsTheme.primaryColor
                          : ColorsTheme.neutralColor[1000],
                    ),
                    gap(16),
                    _iconButtonBuilder(
                      onTap: () {
                        controller.nextPage();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: controller.currentIndex.value <
                                controller.imageList.length - 1
                            ? ColorsTheme.neutralColor[1000]
                            : ColorsTheme.primaryColor,
                      ),
                      backgroundColor: controller.currentIndex.value <
                              controller.imageList.length - 1
                          ? ColorsTheme.primaryColor
                          : ColorsTheme.neutralColor[1000],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _overviewBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.state?.name ?? "",
            style: TypographyTheme.titleLarge,
          ),
          gap(16),
          Row(
            children: [
              TagChip.filled(
                text: "Tipe ${controller.state?.dormitoryType}",
              ),
              gap(8),
              TagChip.filled(
                text: controller.state?.dormitoryGender.value ?? "",
              ),
            ],
          ),
          gap(8),
          Text(
            "${(controller.state?.dormitoryPrice.price ?? 0).toRupiah()} / Bulan",
            style: TypographyTheme.labelLarge,
          ),
          gap(8),
          InkWell(
            onTap: () {
              controller.intentToMap();
            },
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: ColorsTheme.primaryColor,
                ),
                gap(8),
                Expanded(
                  child: Text(
                    controller.state?.dormitoryLocation.address ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          gap(8),
          Text(
            "${controller.state?.availableRoom ?? 0} Kamar Tersedia",
            style: TypographyTheme.labelMedium.copyWith(
              color: ColorsTheme.successColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _specificationBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Spesifikasi & Fasilitas Kamar",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          _itemBuilder(
            text: "3 x 4 Meter",
            icon: Icon(
              KostRushApp.roomSize,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Tempat Tidur",
            icon: Icon(
              KostRushApp.bed,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Lemari",
            icon: Icon(
              KostRushApp.archive,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Kamar Mandi",
            icon: Icon(
              KostRushApp.bathtub,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "AC",
            icon: Icon(
              KostRushApp.airConditioner,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Bantal & Guling",
            icon: Icon(
              KostRushApp.pillow,
              color: ColorsTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bathFacilityBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fasilitas Kamar Mandi",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          _itemBuilder(
            text: "Kloset Duduk",
            icon: Icon(
              KostRushApp.toilet,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Shower",
            icon: Icon(
              KostRushApp.shower,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Washtafel",
            icon: Icon(
              KostRushApp.sink,
              color: ColorsTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _rulesBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Peraturan Khusus Kos",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          _itemBuilder(
            text: "Diisi maksimal 2 orang/kamar",
            icon: Icon(
              KostRushApp.personHome,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Tidak untuk pasutri",
            icon: Icon(
              KostRushApp.coupleNotAllowed,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Batas bertamu sampai pukul 22.00 WIB",
            icon: Icon(
              KostRushApp.clock,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Tamu wajib lapor",
            icon: Icon(
              KostRushApp.alert,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text:
                "Tamu diperbolehkan menginap tapi tidak diperbolehkan lawan jenis",
            icon: Icon(
              KostRushApp.personHome,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Penyewa kos diharuskan pulang sebelum pukul 24.00 WIB",
            icon: Icon(
              KostRushApp.clock,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text:
                "Deposit Rp. 500.000 Deposit akan dikembalikan di akhir waktu sewa jika tidak terdapat kerusakan pada kos",
            icon: Icon(
              KostRushApp.deposit,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          _itemBuilder(
            text: "Tidak diperbolehkan membawa hewan peliharaan",
            icon: Icon(
              KostRushApp.petNotAllowed,
              color: ColorsTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButtonBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(8),
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(64, 48),
              ),
              side: MaterialStateProperty.all(
                BorderSide(color: ColorsTheme.primaryColor),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: ColorsTheme.primaryColor,
            ),
          ),
          gap(8),
          Expanded(
            child: MainButton(
              label: "Ajukan Sewa",
              buttonWidth: ButtonWidth.full,
              onTap: () {
                controller.navigateToOrderForm();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _iconButtonBuilder({
    required Function() onTap,
    required Widget icon,
    Color? backgroundColor,
  }) {
    return IconButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? ColorsTheme.neutralColor[1000],
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      icon: icon,
    );
  }

  Widget _itemBuilder({
    required String text,
    required Widget icon,
  }) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          gap(8),
          Expanded(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
