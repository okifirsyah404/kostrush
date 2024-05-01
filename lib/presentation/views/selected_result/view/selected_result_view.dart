import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/base_view.dart';
import '../../../../data/enum/dorm_gender_enum.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/card/dorm_card.dart';
import '../controller/selected_result_controller.dart';

class SelectedResultView extends BaseView<SelectedResultController> {
  const SelectedResultView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: controller.title,
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 240,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Center(
            child: DormCard(
              dormGenderEnum: DormGenderEnum.MALE,
              price: (index + 1) * 100000,
              name: "Kost Pak Agung ${index + 1}",
              address: "Jl. Raya Nganjuk No. ${index + 1}",
              maxImageWidth: Get.width,
            ),
          );
        },
      ),
    );
  }
}
