part of 'home_cubit_cubit.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class LoadingState extends HomeCubitState {}

final class DataLoadedState extends HomeCubitState {
  final List<HomePageModel> homePageModel;

  DataLoadedState(this.homePageModel);
}

final class ErrorState extends HomeCubitState {
  final String? message;

  ErrorState({required this.message});
}
