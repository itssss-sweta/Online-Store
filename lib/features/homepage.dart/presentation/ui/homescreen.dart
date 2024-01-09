import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/components/appbar.dart';
import 'package:online_store/core/components/bottomnavbar.dart';
import 'package:online_store/core/components/shimmereffect.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/core/constants/textstyle.dart';
import 'package:online_store/features/homepage.dart/presentation/ui/components/categories.dart';
import 'package:online_store/features/homepage.dart/presentation/ui/components/productlist.dart';
import 'package:online_store/features/homepage.dart/presentation/cubit/home/home_cubit_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the call to getCategories() when the screen is initialized
    context.read<HomeCubitCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    // Access the HomeCubitCubit instance
    final homePageModel = context.read<HomeCubitCubit>();

    return FutureBuilder(
        // Use FutureBuilder to handle the asynchronous loading of products
        future: homePageModel.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: ShimmerLoadingWidget(),
            );
          } else if (snapshot.hasError) {
            // Display an error message if the future encounters an error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            log(homePageModel.homePageModel.toString());
            return Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 50),
                child: CustomAppBar(
                  products: homePageModel.homePageModel,
                ),
              ),
              body: BlocBuilder<HomeCubitCubit, HomeCubitState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const ShimmerLoadingWidget();
                  }
                  if (state is ErrorState) {
                    return Center(
                      child: Text(state.message ?? ''),
                    );
                  }
                  // Build the main content of the screen using the retrieved data
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          'Categories',
                          style: lightStyle20,
                        ),
                        Container(
                            padding: all8padding,
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homePageModel.categories?.length ?? 0,
                              itemBuilder: (context, index) {
                                if (homePageModel.categories == null ||
                                    index >= homePageModel.categories!.length) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return CategoryList(
                                  category: homePageModel.categories![index],
                                );
                              },
                            )),
                        Padding(
                          padding: smallsymmetric,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Browse Products',
                                  style: semiboldStyle20)),
                        ),
                        GridViewContainer(
                            latestproduct: state is DataLoadedState
                                ? state.homePageModel
                                : null),
                      ],
                    ),
                  );
                },
              ),
              bottomNavigationBar: const NavBarBottom(),
            );
          }
        });
  }
}
