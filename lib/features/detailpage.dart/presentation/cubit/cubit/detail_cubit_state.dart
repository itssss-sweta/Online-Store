part of 'detail_cubit_cubit.dart';

sealed class DetailCubitState {}

final class DetailCubitInitial extends DetailCubitState {}

final class DetailLoadingState extends DetailCubitState {}

final class DetailLoadedState extends DetailCubitState {}

final class DetailErrorState extends DetailCubitState {
  final String? message;

  DetailErrorState({required this.message});
}
