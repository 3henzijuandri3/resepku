import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:resepku/models/Recipe.dart';

class RecipeService {
  Future<List<Recipe>> getRandomRecipe() async {

    try {

      final res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
      if(res.statusCode == 200){
        List<Recipe> recipes = List<Recipe>.from(
          jsonDecode(res.body)['meals'].map(
                (recipe) => Recipe.fromJson(recipe),
          ),
        );
        return recipes;
      }

      throw jsonDecode(res.body)['message'];
    } catch (e){
      rethrow;
    }

  }

  Future<List<Recipe>>getRecipeById(String id) async {

    try {

      final res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));

      if(res.statusCode == 200){
        return List<Recipe>.from(
          jsonDecode(res.body)['meals'].map(
                (recipe) => Recipe.fromJson(recipe),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e){
      rethrow;
    }

  }

  Future<List<Recipe>> getMultipleRecipe() async {

    try {

      final res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian'));
      if(res.statusCode == 200){
        List<Recipe> recipes = List<Recipe>.from(
          jsonDecode(res.body)['meals'].map(
                (recipe) => Recipe.fromJson(recipe),
          ),
        );
        return recipes;
      }

      throw jsonDecode(res.body)['message'];
    } catch (e){
      rethrow;
    }

  }

  Future<List<Recipe>>getRecipeByArea(String area) async {

    try {

      final res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?a=$area'));

      if(res.statusCode == 200){
        return List<Recipe>.from(
          jsonDecode(res.body)['meals'].map(
                (recipe) => Recipe.fromJson(recipe),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e){
      rethrow;
    }

  }

  Future<List<Recipe>>getRecipeByCategory(String category) async {

    try {

      final res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));

      if(res.statusCode == 200){
        return List<Recipe>.from(
          jsonDecode(res.body)['meals'].map(
                (recipe) => Recipe.fromJson(recipe),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e){
      rethrow;
    }

  }

  Future<List<Recipe>>getRecipeByName(String name) async {

    try {

      final res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$name'));

      if(res.statusCode == 200){
        return List<Recipe>.from(
          jsonDecode(res.body)['meals'].map(
                (recipe) => Recipe.fromJson(recipe),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e){
      rethrow;
    }

  }
}





















