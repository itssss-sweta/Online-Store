import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/components/appbar.dart';
import 'package:online_store/core/components/bottomnavbar.dart';
import 'package:online_store/core/components/shimmereffect.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/core/constants/textstyle.dart';
import 'package:online_store/features/homepage.dart/presentation/cubit/home/home_cubit_cubit.dart';
import 'package:online_store/features/homepage.dart/presentation/cubit/search/cubit/search_cubit_cubit.dart';
import 'package:online_store/features/homepage.dart/presentation/ui/components/productlist.dart';

class SearchScreen extends StatefulWidget {
  final String? searchString;
  const SearchScreen({super.key, this.searchString});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubitCubit>().getProducts();
    final products = context.read<HomeCubitCubit>();
    log(products.homePageModel.toString());

    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
        child: CustomAppBar(
          products: products.homePageModel,
        ),
      ),
      body: BlocBuilder<SearchCubitCubit, SearchCubitState>(
          builder: (context, state) {
        if (state is SearchLoadingState) {
          return const ShimmerLoadingWidget();
        }
        if (state is SearchErrorState) {
          return Center(
            child: Text(state.message ?? ''),
          );
        }

        if (state is SearchFoundState) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: smallsymmetric,
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Searched Result: ${widget.searchString}  ',
                          style: regularStyle15)),
                ),
                GridViewContainer(latestproduct: state.searchPageModel),
              ],
            ),
          );
        } else {
          return Center(
            // Display a message when no search results are found
            child: Text(
              'No products found!',
              style: semiboldStyle20,
              textAlign: TextAlign.center,
            ),
          );
        }
      }),
      bottomNavigationBar: const NavBarBottom(),
    );
  }
}
