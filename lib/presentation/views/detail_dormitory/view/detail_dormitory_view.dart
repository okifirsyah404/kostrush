import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/components/icon_data/kost_rush_app_icons.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';
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
                  child: _descriptionBuilder(),
                ),
                sliverDivider(),
                SliverToBoxAdapter(
                  child: _facilityDescriptionBuilder(),
                ),
                sliverDivider(),
                SliverToBoxAdapter(
                  child: _rulesDescriptionBuilder(),
                ),
                // SliverToBoxAdapter(
                //   child: _specificationBuilder(),
                // ),
                // sliverDivider(),
                // SliverToBoxAdapter(
                //   child: _bathFacilityBuilder(),
                // ),
                // sliverDivider(),
                // SliverToBoxAdapter(
                //   child: _rulesBuilder(),
                // ),
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
      child: SizedBox(
        height: 240,
        width: double.infinity,
        child: Image.asset(
          controller.imageList[0],
          fit: BoxFit.cover,
        ),
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
            "Kos Kenanga Pasar IV",
            style: TypographyTheme.titleLarge,
          ),
          gap(16),
          Row(
            children: [
              TagChip.filled(
                text: "Tipe Premium",
              ),
              gap(8),
              TagChip.filled(
                text: "Putra",
              ),
            ],
          ),
          gap(8),
          Text(
            1000000.toRupiah() + " / Bulan",
            style: TypographyTheme.labelLarge,
          ),
          gap(8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: ColorsTheme.primaryColor,
              ),
              gap(8),
              Expanded(
                child: Text(
                  "Jl. Kenanga Pasar IV No. 1, Jakarta Utara, DKI Jakarta, Indonesia, 14450, Jakarta Utara, DKI Jakarta, Indonesia",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          gap(8),
          Text(
            "2 Kamar Tersedia",
            style: TypographyTheme.labelMedium.copyWith(
              color: ColorsTheme.successColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deskripsi Kost",
            style: TypographyTheme.labelLarge,
          ),
          gap(8),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        ],
      ),
    );
  }

  Widget _facilityDescriptionBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fasilitas",
            style: TypographyTheme.labelLarge,
          ),
          gap(8),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        ],
      ),
    );
  }

  Widget _rulesDescriptionBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Peraturan Khusus Kos",
            style: TypographyTheme.labelLarge,
          ),
          gap(8),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        ],
      ),
    );
  }

  @Deprecated("Moving to [_facilityDescriptionBuilder()]")
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

  @Deprecated("Moving to [_descriptionBuilder()]")
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

  @Deprecated("Moving to [_rulesDescriptionBuilder()]")
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
      child: MainButton(
        label: "Ajukan Sewa",
        buttonWidth: ButtonWidth.full,
        onTap: () {
          controller.navigateToOrderForm();
        },
      ),
      // child: Row(
      //   children: [
      //     IconButton(
      //       onPressed: () {},
      //       style: ButtonStyle(
      //         padding: MaterialStateProperty.all(
      //           const EdgeInsets.all(8),
      //         ),
      //         minimumSize: MaterialStateProperty.all(
      //           const Size(64, 48),
      //         ),
      //         side: MaterialStateProperty.all(
      //           BorderSide(color: ColorsTheme.primaryColor),
      //         ),
      //         shape: MaterialStateProperty.all(
      //           RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //         ),
      //       ),
      //       icon: FaIcon(
      //         FontAwesomeIcons.whatsapp,
      //         color: ColorsTheme.primaryColor,
      //       ),
      //     ),
      //     gap(8),
      //     Expanded(
      //       child: MainButton(
      //         label: "Ajukan Sewa",
      //         buttonWidth: ButtonWidth.full,
      //         onTap: () {
      //           controller.navigateToOrderForm();
      //         },
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget _itemBuilder({
    required String text,
    required Widget icon,
  }) {
    return Row(
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
    );
  }
}
