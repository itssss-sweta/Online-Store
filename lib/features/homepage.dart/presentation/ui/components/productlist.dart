import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_store/core/components/productbox.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/features/homepage.dart/domain/entity/product_entity.dart';

class GridViewContainer extends StatelessWidget {
  final List<ProductListEntity?>? latestproduct;
  const GridViewContainer({
    super.key,
    this.latestproduct,
  });

  @override
  Widget build(BuildContext context) {
    log(latestproduct?.length.toString() ?? '0');
    return Padding(
      padding: lrfifteen,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 260,
        ),
        itemCount: latestproduct?.length ?? 0,
        itemBuilder: (context, index) {
          final docs = latestproduct?[index];

          return ProductBox(
            brandTitle: docs?.title ?? '',
            price: docs?.price.toString() ?? '',
            image: docs?.image ?? '',
            desc: docs?.description ?? '',
            category: docs?.category,
            id: docs?.id,
            rating: docs?.rating?.rate ?? 0,
            count: docs?.rating?.count ?? 0,
          );
        },
      ),
    );
  }
}
