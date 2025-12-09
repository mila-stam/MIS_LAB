// lib/services/favorites_service.dart
import '../models/recipe.dart';

class FavoritesService {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  final List<Recipe> _favorites = [];

  List<Recipe> get favorites => List.unmodifiable(_favorites);

  void toggleFavorite(Recipe recipe) {
    final index = _favorites.indexWhere((r) => r.id == recipe.id);
    if (index >= 0) {
      _favorites.removeAt(index);
      recipe.isFavorite = false;
    } else {
      _favorites.add(recipe);
      recipe.isFavorite = true;
    }
  }

  bool isFavorite(String id) {
    return _favorites.any((r) => r.id == id);
  }
}
