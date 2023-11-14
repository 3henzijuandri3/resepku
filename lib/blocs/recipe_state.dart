part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeFailed extends RecipeState {
  final String e;
  const RecipeFailed(this.e);

  @override
  List<Object> get props => [e];
}

class RecipeSuccess extends RecipeState {
  final List<Recipe> recipes;
  const RecipeSuccess(this.recipes);

  @override
  // TODO: implement props
  List<Object?> get props => [recipes];
}









