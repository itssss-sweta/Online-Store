import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_store/config/routes/route.dart';
import 'package:online_store/core/components/navbaricon.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/key.dart';

class NavBarBottom extends StatelessWidget {
  const NavBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        border: Border.all(
          width: 1,
          color: whitish,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavIcons(
            icon: Icons.home,
            ontap: () {
              log('tapped');
              navigationKey.currentState?.pushNamed(Routes.homeScreen);
              log('tapped');
            },
          ),
          BottomNavIcons(
            icon: Icons.notifications,
            ontap: () {},
          ),
          BottomNavIcons(
            icon: Icons.person,
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
