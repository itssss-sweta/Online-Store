part of 'search_cubit_cubit.dart';

sealed class SearchCubitState {}

final class SearchCubitInitial extends SearchCubitState {}

final class SearchLoadingState extends SearchCubitState {}

final class SearchFoundState extends SearchCubitState {
  final List<HomePageModel> searchPageModel;

  SearchFoundState(this.searchPageModel);
}

final class CategoryBrowseState extends SearchCubitState {}

final class SearchEmptyState extends SearchCubitState {}

final class SearchErrorState extends SearchCubitState {
  final String? message;

  SearchErrorState({required this.message});
}
