// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import '../services/favorites_service.dart';
import '../screens/meal_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesService favoritesService = FavoritesService();

  @override
  Widget build(BuildContext context) {
    final favorites = favoritesService.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite recipes'),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('No favorites yet'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final recipe = favorites[index];
          return ListTile(
            leading: Image.network(recipe.imageUrl, width: 60, fit: BoxFit.cover),
            title: Text(recipe.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealDetailScreen(mealId: recipe.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
