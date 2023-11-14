part of 'search_recipe_bloc.dart';

@immutable
abstract class SearchRecipeState extends Equatable{
  const SearchRecipeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchRecipeInitial extends SearchRecipeState {}

class SearchRecipeLoading extends SearchRecipeState {}

class SearchRecipeFailed extends SearchRecipeState {
  final String e;
  const SearchRecipeFailed(this.e);

  @override
  List<Object> get props => [e];
}

class SearchRecipeSuccess extends SearchRecipeState {
  final List<Recipe> recipes;
  const SearchRecipeSuccess(this.recipes);

  @override
  // TODO: implement props
  List<Object?> get props => [recipes];
}
