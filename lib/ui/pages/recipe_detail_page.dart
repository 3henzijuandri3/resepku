import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resepku/shared/app_theme.dart';
import '../../blocs/recipe_bloc.dart';
import '../../models/Recipe.dart';

class RecipeDetailPage extends StatefulWidget {
  final String recipeId;

  const RecipeDetailPage({Key? key, required this.recipeId}) : super(key: key);

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {

  Recipe? recipeDetail;
  late RecipeBloc recipeBloc;
  int currentContentType = 1;

  @override
  void initState() {
    super.initState();

    recipeBloc = context.read<RecipeBloc>()..add(GetRecipeById(widget.recipeId));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Detail'),
        ),

        body: BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {

              if(state is RecipeLoading){
                return const Center(
                    child: CircularProgressIndicator()
                );
              }

              if(state is RecipeSuccess){

                recipeDetail = state.recipes.first;

                return ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                  children: [

                    // Image Section
                    SectionImage(recipeDetail!),

                    const SizedBox(height: 30),

                    // Content Section
                    SectionContent(recipeDetail!)

                  ],
                );
              }

              return const Center(
                  child: Text('Something Wrong :(')
              );
            }
        ),
      ),
    );
  }

  Widget SectionImage(Recipe recipe){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // Recipe Name
        Text(
          recipe.strMeal.toString(),
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold
          ),
        ),

        const SizedBox(height: 8),

        // Recipe Image
        Container(
          width: double.infinity,
          height: 280,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(recipe.strMealThumb.toString()),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Category & Country
        Row(
          children: [

            // Category
            Icon(
              Icons.soup_kitchen_outlined,
              color: yellowColor,
              size: 30,
            ),

            const SizedBox(width: 4),

            Text(
              recipe.strCategory.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light
              ),
            ),

            const Spacer(),

            // Country
            Icon(
              Icons.flag_outlined,
              color: yellowColor,
              size: 30,
            ),

            const SizedBox(width: 4),

            // From
            Text(
              recipe.strArea.toString(),
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light
              ),
            ),

          ],
        )
      ],
    );
  }

  Widget SectionContent(Recipe recipe){
    List<String?> listIngredients = combineIngredientsAndMeasures(recipe);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20)
      ),

      child: Column(
        children: [

          // Content Type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // Preparation
              GestureDetector(
                onTap: (){
                  setState(() {
                    currentContentType = 1;
                  });
                },

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fastfood_outlined,
                      color: currentContentType == 1 ? yellowColor : greyColor,
                      size: 20,
                    ),

                    const SizedBox(height: 4),

                    Text(
                        'Preparation',
                        style: currentContentType == 1
                            ? yellowTextStyle.copyWith(fontSize: 14, fontWeight: semiBold)
                            : greyTextStyle.copyWith(fontSize: 14, fontWeight: regular)
                    ),
                  ],
                ),
              ),

              // Ingredients
              GestureDetector(
                onTap: (){
                  setState(() {
                    currentContentType = 2;
                  });
                },

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long_sharp,
                      color: currentContentType == 2 ? yellowColor : greyColor,
                      size: 20,
                    ),

                    const SizedBox(height: 4),

                    Text(
                        'Ingredients',
                        style: currentContentType == 2
                            ? yellowTextStyle.copyWith(fontSize: 14, fontWeight: semiBold)
                            : greyTextStyle.copyWith(fontSize: 14, fontWeight: regular)
                    ),

                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 1,
            decoration: BoxDecoration(
                color: yellowColor
            ),
          ),
          const SizedBox(height: 16),

          // Content Value
          Text(
            currentContentType == 1 ? recipe.strInstructions.toString() : listIngredients.join(", "),
            maxLines: currentContentType == 1 ? 10 : listIngredients.length,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular
            ),
          ),
        ],
      ),
    );
  }

  List<String?> combineIngredientsAndMeasures(Recipe recipe) {
    List<String?> ingredients = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = recipe.getIngredient(i);
      final measure = recipe.getMeasure(i);

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add("$measure of $ingredient");
      }
    }

    return ingredients;
  }
}




































