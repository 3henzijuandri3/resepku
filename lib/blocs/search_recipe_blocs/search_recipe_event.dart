part of 'search_recipe_bloc.dart';

@immutable
abstract class SearchRecipeEvent extends Equatable{
  const SearchRecipeEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchRecipeDefault extends SearchRecipeEvent{}

class SearchRecipeArea extends SearchRecipeEvent {
  final String area;
  const SearchRecipeArea(this.area);

  @override
  // TODO: implement props
  List<Object?> get props => [area];
}

class SearchRecipeCategory extends SearchRecipeEvent {
  final String category;
  const SearchRecipeCategory(this.category);

  @override
  // TODO: implement props
  List<Object?> get props => [category];
}

class SearchRecipeName extends SearchRecipeEvent {
  final String name;
  const SearchRecipeName(this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
