import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/Recipe.dart';
import '../../services/recipe_service.dart';

part 'random_recipe_event.dart';
part 'random_recipe_state.dart';

class RandomRecipeBloc extends Bloc<RandomRecipeEvent, RandomRecipeState> {
  RandomRecipeBloc() : super(RandomRecipeInitial()) {
    on<RandomRecipeEvent>((event, emit) async {
      if(event is GetRandomRecipe){
        try{

          emit(RandomRecipeLoading());

          final recipes = await RecipeService().getRandomRecipe();

          emit(RandomRecipeSuccess(recipes));
        } catch (e) {
          emit(RandomRecipeFailed(e.toString()));
        }
      }
    });
  }
}
