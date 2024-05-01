import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/card/transaction_card.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
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
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: 3,
        separatorBuilder: (context, index) => gap(8),
        itemBuilder: (context, index) {
          return TransactionCard(
            name: "Kosan Pak Joko",
            address:
                "Jl. Raya Ciputat Parung No. 1, Ciputat, Tangerang Selatan",
            price: 1000000,
            status: controller.transactionStatus[index],
            onTap: () {
              controller.navigateToDetailTransaction();
            },
          );
        },
      ),
    );
  }
}
