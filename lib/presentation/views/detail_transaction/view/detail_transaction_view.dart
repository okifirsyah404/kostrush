import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';
import 'package:kostrushapp/utils/mixins/custom_sliver_mixin.dart';

import '../../../../base/base_view.dart';
import '../../../../res/painter/dash_line_painter.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/input/main_text_input.dart';
import '../../../themes/typography_theme.dart';
import '../controller/detail_transaction_controller.dart';

class DetailTransactionView extends BaseView<DetailTransactionController>
    with CustomSliverMixin {
  const DetailTransactionView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Detail Transaksi",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _formBuilder(),
          ),
          sliverDivider(),
          SliverToBoxAdapter(
            child: _timePickerBuilder(),
          ),
          sliverDivider(),
          SliverToBoxAdapter(
            child: _summaryBuilder(),
          ),
          sliverDivider(),
          SliverToBoxAdapter(
            child: _bottomButtonBuilder(),
          )
        ],
      ),
    );
  }

  Widget _formBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Penyewa",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          MainTextInput(
            controller: controller.nameController,
            label: "Nama",
            focusNode: controller.noFocusNode,
          ),
          gap(8),
          MainTextInput(
            controller: controller.phoneController,
            label: "Nomor Telepon",
            focusNode: controller.noFocusNode,
          ),
          gap(8),
          MainTextInput(
            controller: controller.occupationController,
            label: "Pekerjaan",
            focusNode: controller.noFocusNode,
          ),
          gap(8),
          MainTextInput(
            controller: controller.roomTypeController,
            label: "Tipe Kamar",
            focusNode: controller.noFocusNode,
          ),
        ],
      ),
    );
  }

  Widget _timePickerBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tanggal Sewa Kost",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          MainTextInput(
            controller: controller.dateController,
            label: "Tanggal Mulai Sewa",
            hintText: "Pilih Tanggal",
            focusNode: controller.noFocusNode,
            suffixIcon: const FaIcon(FontAwesomeIcons.calendarAlt),
          ),
          gap(8),
          MainTextInput(
            controller: controller.durationController,
            label: "Durasi Sewa",
            hintText: "Pilih Durasi",
            focusNode: controller.noFocusNode,
            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ],
      ),
    );
  }

  Widget _summaryBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Biaya Sewa Kost",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harga Sewa",
                    style: TypographyTheme.bodyMedium,
                  ),
                  Text(
                    "Pemabayaran diakukan secara tunai",
                    style: TypographyTheme.bodySmall,
                  )
                ],
              ),
              const Spacer(),
              Text(
                "Rp 1.000.000",
                style: TypographyTheme.labelMedium,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomPaint(
              painter: DashedLinePainter(),
              child: Container(
                height: 1,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Total Biaya Sewa Kost",
                style: TypographyTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                "Rp 1.000.000",
                style: TypographyTheme.labelLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomButtonBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: ColorsTheme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Selesai",
                style: TypographyTheme.labelMedium.copyWith(
                  color: ColorsTheme.neutralColor[1000],
                ),
              ),
            ),
          ),
          gap(8),
          Text(
            TransactionStatusEnum.done.message,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
