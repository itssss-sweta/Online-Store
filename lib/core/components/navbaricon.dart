import 'package:flutter/material.dart';
import 'package:online_store/core/constants/colors.dart';

class BottomNavIcons extends StatelessWidget {
  final IconData? icon;
  final Function()? ontap;
  const BottomNavIcons({super.key, this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(
        icon,
        size: 30,
        color: grey,
      ),
    );
  }
}
