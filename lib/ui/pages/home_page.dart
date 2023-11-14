import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resepku/blocs/random_recipe_blocs/random_recipe_bloc.dart';
import 'package:resepku/helper/RecipePassing.dart';
import 'package:resepku/shared/app_theme.dart';
import 'package:resepku/ui/widgets/recipe_card_custom.dart';
import '../../models/Recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Recipe? randomRecipe;

  late RandomRecipeBloc randomRecipeBloc;

  @override
  void initState() {
    super.initState();

    randomRecipeBloc = context.read<RandomRecipeBloc>()
      ..add(GetRandomRecipe());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
          children: [

            //Top Section
            topSection(),

            const SizedBox(height: 40),

            // Random Recipe
            BlocBuilder<RandomRecipeBloc, RandomRecipeState>(
              builder: (context, state) {
                  if (state is RandomRecipeLoading) {
                    return const Center(
                        child: CircularProgressIndicator()
                    );
                  }

                  if(state is RandomRecipeSuccess){
                    randomRecipe = state.recipes.first;
                    return RandomRecipeCard(
                        recipeName: randomRecipe!.strMeal.toString(),
                        recipeCategory: randomRecipe!.strCategory.toString(),
                        recipeFrom: randomRecipe!.strArea.toString(),
                        recipeImg: randomRecipe!.strMealThumb.toString(),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/recipe-detail',
                            arguments: randomRecipe!.idMeal, // Pass the recipeId as an argument
                          );
                        }
                    );
                  }

                  return const Center(
                      child: Text('Something Wrong :(')
                  );

                },
            ),

            const SizedBox(height: 40),

            // Food Category
            categorySection(),

            const SizedBox(height: 40),

            // Discover World Food
            worldFood()

          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: whiteColor,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(), // Add a notch for FAB if needed

        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedItemColor: yellowColor,
          unselectedItemColor: blackColor,

          selectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),

          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),
          showSelectedLabels: true, // Show labels for selected items
          showUnselectedLabels: true, // Show labels for unselected items

          items: const [
            // Home
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 24),
              label: 'Home',
            ),

            // Recipes
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen_rounded, size: 24),
              label: 'Recipes',
            ),
          ],
        ),
      ),

    );
  }

  Widget topSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // Text Kanan
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resepku',
              style: blackTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: medium
              ),
            ),

            Text(
              'Discover Recipe',
              style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium
              ),
            )
          ],
        ),

        // Logo Kiri
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/logo_resepku.png'),
            ),
          ),
        )

      ],
    );
  }

  Widget categorySection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Category & See more
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            // Popular Category
            Text(
              'Popular Category',
              style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold
              ),
            ),

            // See More
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/all-recipe');
              },
              child: Text(
                'See more',
                style: yellowTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold
                ),
              ),
            ),

          ],
        ),

        const SizedBox(height: 10),

        // Category Item
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Breakfast
              RecipeCategoryCard(
                  label: 'Breakfast',
                  assetUrl: 'assets/breakfast_category.png',
                  onTap: (){
                    RecipePassing data = RecipePassing(
                      type: 'category',
                      value: 'Breakfast',
                    );

                    Navigator.pushNamed(
                      context,
                      '/all-recipe',
                      arguments: data, // Pass the recipeId as an argument
                    );
                  }
              ),

              const SizedBox(width: 20),

              // Side
              RecipeCategoryCard(
                  label: 'Side',
                  assetUrl: 'assets/side_category.png',
                  onTap: (){
                    RecipePassing data = RecipePassing(
                      type: 'category',
                      value: 'Side',
                    );

                    Navigator.pushNamed(
                      context,
                      '/all-recipe',
                      arguments: data, // Pass the recipeId as an argument
                    );
                  }
              ),

              const SizedBox(width: 20),

              // Dessert
              RecipeCategoryCard(
                  label: 'Dessert',
                  assetUrl: 'assets/dessert_category.png',
                  onTap: (){
                    RecipePassing data = RecipePassing(
                      type: 'category',
                      value: 'Dessert',
                    );

                    Navigator.pushNamed(
                      context,
                      '/all-recipe',
                      arguments: data, // Pass the recipeId as an argument
                    );
                  }
              ),

              const SizedBox(width: 20),

              // Vegan
              RecipeCategoryCard(
                  label: 'Vegan',
                  assetUrl: 'assets/vegan_category.png',
                  onTap: (){
                    RecipePassing data = RecipePassing(
                      type: 'category',
                      value: 'Vegan',
                    );

                    Navigator.pushNamed(
                      context,
                      '/all-recipe',
                      arguments: data, // Pass the recipeId as an argument
                    );
                  }
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget worldFood(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        // World Food
        Text(
          'Discover World Food',
          style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold
          ),
        ),

        const SizedBox(height: 14),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // American
            RecipeCardCountry(
                label: 'American',
                imgUrl: 'assets/usa_flag.png',
                onTap: (){
                  RecipePassing data = RecipePassing(
                    type: 'area',
                    value: 'American',
                  );

                  Navigator.pushNamed(
                    context,
                    '/all-recipe',
                    arguments: data, // Pass the recipeId as an argument
                  );
                }
            ),

            // American
            RecipeCardCountry(
                label: 'France',
                imgUrl: 'assets/france_flag.jpg',
                onTap: (){
                  RecipePassing data = RecipePassing(
                    type: 'area',
                    value: 'French',
                  );

                  Navigator.pushNamed(
                    context,
                    '/all-recipe',
                    arguments: data, // Pass the recipeId as an argument
                  );
                }
            ),

            // American
            RecipeCardCountry(
                label: 'Italy',
                imgUrl: 'assets/italia_flag.png',
                onTap: (){
                  RecipePassing data = RecipePassing(
                    type: 'area',
                    value: 'Italian',
                  );

                  Navigator.pushNamed(
                    context,
                    '/all-recipe',
                    arguments: data, // Pass the recipeId as an argument
                  );
                }
            ),
          ],
        ),
      ],
    );
  }
}






















