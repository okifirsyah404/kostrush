import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/card/transaction_card.dart';
import 'package:kostrushapp/res/remote/remote_constant.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../../data/enum/transaction_status_enum.dart';
import '../../../../../components/appbar/default_appbar.dart';
import '../controller/transaction_controller.dart';

class TransactionView extends BaseView<TransactionController> {
  const TransactionView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Transaksi",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    final random = Random();

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.state?.length ?? 0,
        separatorBuilder: (context, index) => gap(8),
        itemBuilder: (context, index) {
          return TransactionCard(
            name: controller.state?[index].dormitory.name ?? "",
            address:
                controller.state?[index].dormitory.dormitoryLocation.address ??
                    "",
            price: controller.state?[index].dormitory.dormitoryPrice.price ?? 0,
            status: controller.state?[index].status ??
                TransactionStatusEnum.pending,
            imageUrl:
                "${RemoteConstant.baseUrl}${controller.state?[index].dormitory.dormitoryImage[random.nextInt(3)].url}",
            onTap: () {
              controller.navigateToDetailTransaction(
                  controller.state?[index].id ?? "");
            },
          );
        },
      ),
    );
  }
}
