import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/base_view.dart';
import '../../../../data/enum/dorm_gender_enum.dart';
import '../../../../res/remote/remote_constant.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/card/dorm_card.dart';
import '../controller/location_result_controller.dart';

class LocationResultView extends BaseView<LocationResultController> {
  const LocationResultView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Kost Daerah ${controller.arguments.locationName}",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    final random = Random();

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
        itemCount: controller.state?.length ?? 0,
        itemBuilder: (context, index) {
          return DormCard(
            maxImageWidth: Get.width,
            dormGenderEnum: controller.state?[index].dormitoryGender ??
                DormGenderEnum.UNISEX,
            price: controller.state?[index].dormitoryPrice.price ?? 0,
            imageUrl:
                "${RemoteConstant.baseUrl}${controller.state?[index].dormitoryImage[random.nextInt(3)].url}",
            name: controller.state?[index].name ?? "",
            address: controller.state?[index].dormitoryLocation.address ?? "",
            onTap: () {
              controller.navigateToDetail(controller.state?[index].id ?? "");
            },
          );
        },
      ),
    );
  }
}
