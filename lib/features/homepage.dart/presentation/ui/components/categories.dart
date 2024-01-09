import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/constants/colors.dart';
import 'package:online_store/core/constants/padding.dart';
import 'package:online_store/core/constants/textstyle.dart';
import 'package:online_store/features/homepage.dart/presentation/cubit/search/cubit/search_cubit_cubit.dart';

class CategoryList extends StatelessWidget {
  final String? category;
  const CategoryList({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubitCubit>();
    return GestureDetector(
      onTap: () {
        searchCubit.categoryProducts(category: category);
        log(category ?? '');
      },
      child: Container(
        padding: lrfifteen,
        margin: allten,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightestGrey,
        ),
        child: Center(
            child: Text(
          category ?? '',
          style: regularStyle15,
        )),
      ),
    );
  }
}
