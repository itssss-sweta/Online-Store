import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_store/core/components/bottomnavbar.dart';
import 'package:online_store/core/components/shimmereffect.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/core/constants/sizedbox.dart';
import 'package:online_store/core/constants/textstyle.dart';
import 'package:online_store/features/detailpage.dart/presentation/cubit/cubit/detail_cubit_cubit.dart';
import 'package:online_store/features/detailpage.dart/presentation/ui/components/quantity.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0.1,
        title: Text(
          'Online Store',
          style: bold20,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: grey,
            ),
            focusColor: white,
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<DetailCubitCubit, DetailCubitState>(
        builder: (context, state) {
          final detailfetch = context.read<DetailCubitCubit>();
          final data = detailfetch.productDetailModel;

          if (state is DetailLoadingState) {
            return const ShimmerDescription();
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: allfifteen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        padding: allfifteen,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: whitish,
                        ),
                        child: Image.network(
                          data?.image ?? '',
                          cacheHeight: 200,
                          height: 200,
                          // cacheWidth: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      smallh,
                      Text(
                        data?.title ?? '',
                        style: mediumStyle15,
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            itemCount: 5,
                            direction: Axis.horizontal,
                            itemSize: 15,
                            rating: data?.rating?.rate ?? 0,
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
                            '(${data?.rating?.count ?? 0})',
                            style: semiboldStyle10,
                          )
                        ],
                      ),
                      xsmallh,
                      Text(
                        'Rs.${data?.price}',
                        style: semiboldStyle20,
                      ),
                      xsmallh,
                      Text(
                        'Select Quantity',
                        style: mediumStyle15,
                      ),
                      xsmallh,
                      const QuantityBox(),
                      smallh,
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: 'Successfully added to cart',
                            backgroundColor: lightBrownandYellow,
                            textColor: grey,
                            fontSize: 15,
                            gravity: ToastGravity.BOTTOM,
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: brownYellowish,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: all8padding,
                          child: Center(
                            child: Text(
                              'Add to Bag',
                              style: mediumStyle16,
                            ),
                          ),
                        ),
                      ),
                      medh,
                      Text('Product Information', style: semiboldStyle20),
                      smallh,
                      Text(
                        data?.description ?? '',
                        style: mediumStyle15,
                      ),
                      xsmallh,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const NavBarBottom(),
    );
  }
}
