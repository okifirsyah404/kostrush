import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/components/appbar/search_appbar.dart';

import '../../../../base/base_view.dart';
import '../../../../data/enum/dorm_gender_enum.dart';
import '../../../../res/remote/remote_constant.dart';
import '../../../components/card/dorm_card.dart';
import '../controller/search_controller.dart';

class SearchView extends BaseView<SearchViewController> {
  const SearchView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return SearchAppBar(
      controller: controller.searchController,
      focusNode: controller.focusNode,
      onChanged: controller.onChangeSearch,
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
          return Center(
            child: DormCard(
              dormGenderEnum: controller.state?[index].dormitoryGender ??
                  DormGenderEnum.UNISEX,
              price: controller.state?[index].dormitoryPrice.price ?? 0,
              name: controller.state?[index].name ?? "",
              address: controller.state?[index].dormitoryLocation.address ?? "",
              maxImageWidth: Get.width,
              imageUrl:
                  "${RemoteConstant.baseUrl}${controller.state?[index].dormitoryImage[random.nextInt(3)].url}",
              onTap: () {
                controller.navigateToDetailDormitory(
                  controller.state?[index].id ?? "",
                );
              },
            ),
          );
        },
      ),
    );
  }
}
