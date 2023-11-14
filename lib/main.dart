import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resepku/blocs/random_recipe_blocs/random_recipe_bloc.dart';
import 'package:resepku/blocs/recipe_bloc.dart';
import 'package:resepku/blocs/search_recipe_blocs/search_recipe_bloc.dart';
import 'package:resepku/helper/RecipePassing.dart';
import 'package:resepku/shared/app_theme.dart';
import 'package:resepku/ui/pages/all_recipes_page.dart';
import 'package:resepku/ui/pages/home_page.dart';
import 'package:resepku/ui/pages/onboarding_page.dart';
import 'package:resepku/ui/pages/recipe_detail_page.dart';
import 'package:resepku/ui/pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => RecipeBloc()
        ),

        BlocProvider(
            create: (context) => RandomRecipeBloc()
        ),

        BlocProvider(
            create: (context) => SearchRecipeBloc()
        ),
      ],

      child: MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            scaffoldBackgroundColor: lightBackgroundColor,
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: lightBackgroundColor,
              iconTheme: IconThemeData(
                color: blackColor,
              ),
              titleTextStyle: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold
              ),
            )
        ),

          routes: {
            '/': (context) => const SplashScreenPage(),
            '/onboarding': (context) => const OnboardingPage(),
            '/home': (context) => const HomePage(),
            '/recipe-detail': (context) {
              final recipeId = ModalRoute.of(context)!.settings.arguments as String;
              return RecipeDetailPage(recipeId: recipeId);
          },
            '/all-recipe' : (context){
              final data = ModalRoute.of(context)!.settings.arguments as RecipePassing?;
              return AllRecipesPage(data: data);
            }
        }
      ),
    );
  }
}

