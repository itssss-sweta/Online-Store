import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:online_store/features/homepage.dart/data/data_source/remote/urls.dart';
import 'package:online_store/features/homepage.dart/data/models/product_model.dart';
import 'package:online_store/features/homepage.dart/data/repository/api_service.dart';
part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());

  List<HomePageModel>? homePageModel;
  List<String>? categories = [];

  Future getProducts() async {
    emit(LoadingState());

    try {
      final Response response =
          await ApiServiceProduct.getProduct(url: productUrl);

      //Logging API response boudy and status code for debugging
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        homePageModel = homePageModelFromJson(response.body);
        log(homePageModel.toString());
        //emits a state indicating that the data has been successfully loaded
        emit(DataLoadedState(homePageModel!));
      } else {
        // Emits an error state if the API request is not successful
        emit(ErrorState(
            message:
                'Failed to load data. Status code:${response.statusCode}'));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error: $e'));
    }
  }

  Future getCategories() async {
    try {
      final Response response =
          await ApiServiceCategory.getCategory(url: categoryUrl);
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        //Converts json response into a list of strings
        List<String> responseList =
            List<String>.from(jsonDecode(response.body));
        categories = responseList;
        log(categories?.length.toString() ?? '');
      } else {
        emit(ErrorState(
            message:
                'Failed to load data. Status code:${response.statusCode}'));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error: $e'));
    }
  }
}
