import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/meal_details_screen.dart';
import 'services/meal_api_service.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  final MealApiService apiService = MealApiService();

  RecipeApp({super.key});

  void _showRandomRecipe(BuildContext context) async {
    final randomRecipe = await apiService.fetchRandomMeal();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MealDetailScreen(mealId: randomRecipe.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primaryColor: Color(0xFF355070),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFB56576),
          iconTheme: IconThemeData(color: Color(0xFF355070)),
          titleTextStyle: TextStyle(
            color: Color(0xFFF3D0BD),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        scaffoldBackgroundColor: Color(0xFFEAAC8B),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF355070),
          secondary: Color(0xFFE56B6F),
          surface: Color(0xFF6D597A),
          background: Color(0xFFF3D0BD),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF6D597A),
          onBackground: Color(0xFF355070),
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Get the recipe of the day'),
            actions: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFE56B6F),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF6D597A), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFEAAC8B).withOpacity(0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.shuffle, color: Color(0xFF355070)),
                  tooltip: 'Random Recipe',
                  onPressed: () => _showRandomRecipe(context),
                ),
              ),
            ],
          ),
          body: HomeScreen(),
        ),
      ),
    );
  }
}
