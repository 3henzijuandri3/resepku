part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable{
  const RecipeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAllRecipe extends RecipeEvent{}

class GetRecipeById extends RecipeEvent {
  final String id;
  const GetRecipeById(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}











