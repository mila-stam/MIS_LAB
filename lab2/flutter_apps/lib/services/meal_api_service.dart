import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/meal.dart';
import '../models/recipe.dart';

class MealApiService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories.php'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List categoriesJson = data['categories'];
      return categoriesJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Meal>> fetchMealsByCategory(String category) async {
    final url = '$_baseUrl/filter.php?c=${Uri.encodeComponent(category)}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List mealsJson = data['meals'];
      return mealsJson.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals for category $category');
    }
  }

  Future<List<Meal>> searchMeals(String query) async {
    final url = '$_baseUrl/search.php?s=${Uri.encodeComponent(query)}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List? mealsJson = data['meals'];
      if (mealsJson == null) return [];
      return mealsJson.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search meals');
    }
  }

  Future<Recipe> fetchMealDetail(String id) async {
    final url = '$_baseUrl/lookup.php?i=$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final mealJson = data['meals'][0];
      return Recipe.fromJson(mealJson);
    } else {
      throw Exception('Failed to load meal details for id $id');
    }
  }

  Future<Recipe> fetchRandomMeal() async {
    final url = '$_baseUrl/random.php';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final mealJson = data['meals'][0];
      return Recipe.fromJson(mealJson);
    } else {
      throw Exception('Failed to load random meal');
    }
  }
}
