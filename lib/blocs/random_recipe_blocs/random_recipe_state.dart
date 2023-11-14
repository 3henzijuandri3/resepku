part of 'random_recipe_bloc.dart';

@immutable
abstract class RandomRecipeState extends Equatable{
  const RandomRecipeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RandomRecipeInitial extends RandomRecipeState {}

class RandomRecipeLoading extends RandomRecipeState {}

class RandomRecipeFailed extends RandomRecipeState {
  final String e;
  const RandomRecipeFailed(this.e);

  @override
  List<Object> get props => [e];
}

class RandomRecipeSuccess extends RandomRecipeState {
  final List<Recipe> recipes;
  const RandomRecipeSuccess(this.recipes);

  @override
  // TODO: implement props
  List<Object?> get props => [recipes];
}
