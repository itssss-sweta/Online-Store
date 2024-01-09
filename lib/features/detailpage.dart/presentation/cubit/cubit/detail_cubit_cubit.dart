import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:online_store/config/routes/route.dart';
import 'package:online_store/core/constants/key.dart';
import 'package:online_store/features/detailpage.dart/data/data_source/url.dart';
import 'package:online_store/features/detailpage.dart/data/models/detail_model.dart';
import 'package:online_store/features/detailpage.dart/data/repository/apiservice.dart';

part 'detail_cubit_state.dart';

class DetailCubitCubit extends Cubit<DetailCubitState> {
  DetailCubitCubit() : super(DetailCubitInitial());

  ProductDetailModel? productDetailModel;

  Future getProductDetail({String? id}) async {
    try {
      final Response response =
          await ApiServiceProductDetail.getDetail(url: '$productDetailUrl/$id');
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        productDetailModel = productDetailModelFromJson(response.body);
        log(productDetailModel.toString());
        navigationKey.currentState?.pushNamed(Routes.detailScreen);
      } else {
        emit(DetailErrorState(
            message:
                'Failed to load data. Status code:${response.statusCode}'));
      }
    } catch (e) {
      emit(DetailErrorState(message: 'Error: $e'));
    }
  }
}
