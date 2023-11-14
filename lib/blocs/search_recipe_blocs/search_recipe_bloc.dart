import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/Recipe.dart';
import '../../services/recipe_service.dart';

part 'search_recipe_event.dart';
part 'search_recipe_state.dart';

class SearchRecipeBloc extends Bloc<SearchRecipeEvent, SearchRecipeState> {
  SearchRecipeBloc() : super(SearchRecipeInitial()) {
    on<SearchRecipeEvent>((event, emit) async {
      if(event is SearchRecipeDefault){
        try{
          emit(SearchRecipeLoading());

          final recipes = await RecipeService().getMultipleRecipe();

          emit(SearchRecipeSuccess(recipes));
        } catch (e) {
          emit(SearchRecipeFailed(e.toString()));
        }
      }

      if(event is SearchRecipeArea){
        try{
          emit(SearchRecipeLoading());

          final recipes = await RecipeService().getRecipeByArea(event.area);

          emit(SearchRecipeSuccess(recipes));
        } catch (e) {
          emit(SearchRecipeFailed(e.toString()));
        }
      }

      if(event is SearchRecipeCategory){
        try{
          emit(SearchRecipeLoading());

          final recipes = await RecipeService().getRecipeByCategory(event.category);

          emit(SearchRecipeSuccess(recipes));
        } catch (e) {
          emit(SearchRecipeFailed(e.toString()));
        }
      }

      if(event is SearchRecipeName){
        try{
          emit(SearchRecipeLoading());

          final recipes = await RecipeService().getRecipeByName(event.name);

          emit(SearchRecipeSuccess(recipes));
        } catch (e) {
          emit(SearchRecipeFailed(e.toString()));
        }
      }
    });
  }
}
