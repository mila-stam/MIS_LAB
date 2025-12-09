import 'ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String instructions;
  final String imageUrl;
  final String? youtubeUrl;
  final List<Ingredient> ingredients;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.name,
    required this.instructions,
    required this.imageUrl,
    this.youtubeUrl,
    required this.ingredients,
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredients = [];
    for (var i = 1; i <= 20; i++) {
      final ingredientName = json['strIngredient$i'];
      final ingredientMeasure = json['strMeasure$i'];
      if (ingredientName != null &&
          ingredientName.toString().trim().isNotEmpty) {
        ingredients.add(
          Ingredient(
            name: ingredientName.toString(),
            measure: ingredientMeasure?.toString() ?? '',
          ),
        );
      }
    }

    return Recipe(
      id: json['idMeal'],
      name: json['strMeal'],
      instructions: json['strInstructions'],
      imageUrl: json['strMealThumb'],
      youtubeUrl: json['strYoutube'],
      ingredients: ingredients,
    );
  }
}

