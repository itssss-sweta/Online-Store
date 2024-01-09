import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:online_store/config/routes/route.dart';
import 'package:online_store/core/constants/key.dart';
import 'package:online_store/features/homepage.dart/data/data_source/remote/urls.dart';
import 'package:online_store/features/homepage.dart/data/models/product_model.dart';
import 'package:online_store/features/homepage.dart/data/repository/api_service.dart';
import 'package:online_store/features/homepage.dart/domain/entity/product_entity.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit() : super(SearchCubitInitial());

  List<HomePageModel>? homePageModel;
  Future categoryProducts({String? category}) async {
    emit(SearchLoadingState());
    try {
      final Response response =
          await ApiServiceCategoryProducts.getCategoryProducts(
              url: '$specificCategoryUrl/$category');
      log(response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        log(response.body);
        homePageModel = homePageModelFromJson(response.body);
        navigationKey.currentState
            ?.pushNamed(Routes.categoryScreen, arguments: category);
        log(homePageModel.toString());
        emit(SearchFoundState(homePageModel!));
      } else {
        emit(SearchErrorState(
            message:
                'Failed to load data. Status code:${response.statusCode}'));
      }
    } catch (e) {
      emit(SearchErrorState(message: 'Error: $e'));
    }
  }

  void searchProducts(
      String? searchString, List<ProductListEntity?>? products) {
    if (searchString == null ||
        searchString.isEmpty ||
        products == null ||
        products.isEmpty) {
      emit(SearchEmptyState());
    } else {
      // Filters products based on the search string
      List<HomePageModel> matchingProducts = products
          .where((product) =>
              product?.title
                  ?.toLowerCase()
                  .contains(searchString.toLowerCase()) ??
              false)
          .map((product) => product as HomePageModel)
          .toList();
      log(matchingProducts.toString());
      // Emits a state indicating that matching products have been found
      emit(SearchFoundState(matchingProducts));
    }
  }
}
