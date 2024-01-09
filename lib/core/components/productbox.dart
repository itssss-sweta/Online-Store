import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/core/constants/sizedbox.dart';
import 'package:online_store/core/constants/textstyle.dart';
import 'package:online_store/features/detailpage.dart/presentation/cubit/cubit/detail_cubit_cubit.dart';

class ProductBox extends StatelessWidget {
  final String? brandTitle;
  final String? image;
  final String? desc;
  final String? price;
  final int? id;
  final String? category;
  final double? rating;
  final int? count;
  const ProductBox({
    super.key,
    this.brandTitle,
    this.image,
    this.desc,
    this.price,
    this.category,
    this.id,
    this.rating,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DetailCubitCubit>().getProductDetail(id: id.toString());
      },
      child: Container(
        padding: productboxpadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whitish,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    brandTitle ?? '',
                    style: boldStyle12,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                smallh,
                SizedBox(
                  height: 100,
                  child: Image.network(
                    image ?? '',
                    cacheHeight: 200,
                    height: 200,
                    fit: BoxFit.contain,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator.adaptive(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
                smallh,
                Text(
                  desc ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                ),
                xsmallh,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Rs.$price',
                    style: semiboldStyle12,
                  ),
                ),
                xsmallh,
                Row(
                  children: [
                    RatingBarIndicator(
                      itemCount: 5,
                      direction: Axis.horizontal,
                      itemSize: 15,
                      rating: rating ?? 0,
                      unratedColor: grey,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          color: yellow,
                        );
                      },
                    ),
                    xsmallw,
                    Text(
                      '($count)',
                      style: semiboldStyle10,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
