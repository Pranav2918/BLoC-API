import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocwithapi/data/model/food.dart';
import 'package:blocwithapi/data/repositories/food_repository.dart';
import 'package:equatable/equatable.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodRepository repository;

  FoodBloc({required this.repository}) : super(FoodInitialState());

  FoodState get initialState => FoodInitialState();
  @override
  Stream<FoodState> mapEventToState(FoodEvent event) async* {
    if (event is FetchFoodEvent) {
      yield FoodLoadingState();

      try {
        List<Recipe> recipes = await repository.getFoods();
        yield FoodLoadedState(recipes: recipes);
      } catch (e) {
        yield FoodErrorState(message: e.toString());
      }
    }
  }
}
