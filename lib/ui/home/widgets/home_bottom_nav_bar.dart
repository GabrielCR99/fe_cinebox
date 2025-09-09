import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/resource.dart';
import 'home_bottom_nav_bar_item.dart';

final class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

final class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: BottomNavigationBar(
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: 1,
          selectedItemColor: AppColors.redColor,
          unselectedItemColor: AppColors.lightGrey,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            color: AppColors.redColor,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w400,
          ),
          items: [
            HomeBottomNavBarItem(
              label: 'Filmes',
              activeAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_PNG,
              inactiveAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_INATIVO_PNG,
            ),
            HomeBottomNavBarItem(
              label: 'Favoritos',
              activeAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_PNG,
              inactiveAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_INATIVO_PNG,
            ),
            HomeBottomNavBarItem(
              label: 'Perfil',
              activeAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_PNG,
              inactiveAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_INATIVO_PNG,
            ),
          ],
        ),
      ),
    );
  }
}
