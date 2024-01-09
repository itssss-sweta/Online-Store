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

class CategoryScreen extends StatefulWidget {
  final String? category;
  const CategoryScreen({super.key, this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubitCubit>().getProducts();
    final products = context.read<HomeCubitCubit>();
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
        child: CustomAppBar(
          // Pass the products from the HomeCubitCubit to the CustomAppBar
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
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: smallsymmetric,
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Category - ${widget.category}  ',
                          style: semiboldStyle20)),
                ),
                GridViewContainer(
                    latestproduct: state is SearchFoundState
                        ? state.searchPageModel
                        : null),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const NavBarBottom(),
    );
  }
}
