part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class SuccessAddState extends FavoritesState{
  // final String
}
final class SuccessRemoveState extends FavoritesState{}
