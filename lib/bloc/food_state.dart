part of 'food_bloc.dart';

abstract class FoodState extends Equatable {}

class FoodInitialState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadingState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadedState extends FoodState {
  @override
  List<Recipe> recipes;
  FoodLoadedState({
    required this.recipes,
  });

  List<Object> get props => throw UnimplementedError();
}

class FoodErrorState extends FoodState {
  String message;
  FoodErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
