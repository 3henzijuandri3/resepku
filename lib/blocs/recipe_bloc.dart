import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resepku/models/Recipe.dart';
import 'package:http/http.dart' as http;
import 'package:resepku/services/recipe_service.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<RecipeEvent>((event, emit) async{

      if(event is GetRecipeById){
        try{

          emit(RecipeLoading());

          final recipes = await RecipeService().getRecipeById(event.id);

          emit(RecipeSuccess(recipes));
        } catch (e) {
          emit(RecipeFailed(e.toString()));
        }
      }

    });
  }
}

















