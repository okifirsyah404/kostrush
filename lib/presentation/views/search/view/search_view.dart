import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/components/appbar/search_appbar.dart';

import '../../../../base/base_view.dart';
import '../../../../data/enum/dorm_gender_enum.dart';
import '../../../components/card/dorm_card.dart';
import '../controller/search_controller.dart';

class SearchView extends BaseView<SearchViewController> {
  const SearchView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return SearchAppBar(
      controller: controller.searchController,
      focusNode: controller.focusNode,
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
