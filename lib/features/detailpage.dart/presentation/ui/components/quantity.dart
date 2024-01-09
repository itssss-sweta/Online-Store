import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/core/constants/textstyle.dart';

class QuantityBox extends StatefulWidget {
  final int? totalstock;
  const QuantityBox({super.key, this.totalstock});

  @override
  State<QuantityBox> createState() => _QuantityBoxState();
}

class _QuantityBoxState extends State<QuantityBox> {
  int quantity = 1;

  void increase() {
    log('tapped');
    setState(() {
      quantity = quantity + 1;
      log(quantity.toString());
    });
  }

  void decrease() {
    log('tapped');
    if (quantity > 1) {
      setState(() {
        quantity = (quantity) - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: grey,
        ),
      ),
      width: 110,
      padding: all8padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              decrease();

              log(quantity.toString());
            },
            child: Text(
              '-',
              style: bold20,
            ),
          ),
          Text(
            '$quantity',
            style: semiboldStyle20,
          ),
          GestureDetector(
            onTap: () {
              increase();
              log(quantity.toString());
            },
            child: Text(
              '+',
              style: bold20,
            ),
          ),
        ],
      ),
    );
  }
}
