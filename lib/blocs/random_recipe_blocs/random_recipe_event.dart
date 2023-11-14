part of 'random_recipe_bloc.dart';

@immutable
abstract class RandomRecipeEvent extends Equatable{
  const RandomRecipeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetRandomRecipe extends RandomRecipeEvent{}
