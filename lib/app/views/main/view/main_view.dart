import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/app/components/icon_data/kost_rush_app_icons.dart';
import 'package:kostrushapp/app/themes/color_theme.dart';
import 'package:kostrushapp/app/views/main/controller/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pageViews,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onPageChange,
          selectedItemColor: ColorsTheme.primaryColor[900],
          unselectedItemColor: ColorsTheme.primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(KostRushApp.home),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(KostRushApp.basket),
              label: "Transaction",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}