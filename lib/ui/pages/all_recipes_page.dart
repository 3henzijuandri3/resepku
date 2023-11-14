import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resepku/blocs/search_recipe_blocs/search_recipe_bloc.dart';
import 'package:resepku/helper/RecipePassing.dart';
import 'package:resepku/ui/widgets/recipe_card_custom.dart';

import '../../models/Recipe.dart';

class AllRecipesPage extends StatefulWidget {

  final RecipePassing? data;

  const AllRecipesPage({Key? key, this.data}) : super(key: key);

  @override
  State<AllRecipesPage> createState() => _AllRecipesPageState();
}

class _AllRecipesPageState extends State<AllRecipesPage> {

  List<Recipe>? listRecipe;

  late SearchRecipeBloc searchRecipeBloc;

  @override
  void initState() {
    super.initState();

    searchRecipeBloc = context.read<SearchRecipeBloc>();

    if(widget.data?.type != null){

      if(widget.data?.type == 'category'){
        searchRecipeBloc.add(SearchRecipeCategory(widget.data!.value!.toString()));

      } else if(widget.data?.type == 'area'){
        searchRecipeBloc.add(SearchRecipeArea(widget.data!.value!.toString()));
      }

    } else {
      searchRecipeBloc.add(SearchRecipeDefault());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchRecipeBloc, SearchRecipeState>(
          builder: (context, state) {

            if (state is SearchRecipeLoading) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            }

            if(state is SearchRecipeSuccess){
              listRecipe = state.recipes;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
                child: GridView.builder(
                    itemCount: listRecipe!.length,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20
                    ),

                    itemBuilder: (context, index) {
                      return RecipeCard(
                          recipeName: listRecipe![index].strMeal.toString(),
                          assetUrl: listRecipe![index].strMealThumb.toString(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/recipe-detail',
                              arguments: listRecipe![index]
                                  .idMeal, // Pass the recipeId as an argument
                            );
                          }
                      );
                    }
                ),
              );
            }

            return const Center(
                child: Text('Something Wrong :(')
            );

          },
        )
      ),
    );
  }
}
