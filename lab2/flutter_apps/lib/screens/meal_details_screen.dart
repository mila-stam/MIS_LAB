import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/meal_api_service.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;

  MealDetailScreen({required this.mealId});

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool _isLoading = true;
  late Recipe _recipe;
  final MealApiService apiService = MealApiService();

  @override
  void initState() {
    super.initState();
    fetchMealDetail();
  }

  Future<void> fetchMealDetail() async {
    final recipe = await apiService.fetchMealDetail(widget.mealId);
    setState(() {
      _recipe = recipe;
      _isLoading = false;
    });
  }

  Widget buildIngredientList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _recipe.ingredients.map((ingredient) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Text(
            '${ingredient.name} - ${ingredient.measure}',
            style: TextStyle(
              color: Color(0xFF355070),
              fontSize: 15,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAAC8B),
      appBar: AppBar(
        title: Text(
          _isLoading ? 'Loading...' : _recipe.name,
          style: TextStyle(color: Color(0xFFEAAC8B)),
        ),
        backgroundColor: Color(0xFFB56576),
        iconTheme: IconThemeData(color: Color(0xFF355070)),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Color(0xFFB56576)))
          : SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF3D0BD),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Color(0xFF6D597A), width: 2),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF6D597A).withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(_recipe.imageUrl,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  _recipe.name,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF355070),
                    letterSpacing: 0.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18),
                Text('Instructions:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB56576),
                      fontSize: 18,
                    )
                ),
                SizedBox(height: 8),
                Text(
                    _recipe.instructions,
                    style: TextStyle(
                      color: Color(0xFF6D597A),
                      fontSize: 15,
                    )
                ),
                SizedBox(height: 18),
                Text('Ingredients:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE56B6F),
                      fontSize: 18,
                    )
                ),
                buildIngredientList(),
                if (_recipe.youtubeUrl != null && _recipe.youtubeUrl!.isNotEmpty) ...[
                  SizedBox(height: 20),
                  TextButton.icon(
                    icon: Icon(Icons.play_circle_fill, color: Color(0xFFF3D0BD)),
                    label: Text(
                      'Watch Video',
                      style: TextStyle(
                        color: Color(0xFF355070),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFE56B6F),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: Color(0xFF6D597A), width: 1.5),
                      ),
                    ),
                    onPressed: () {
                      // Use url_launcher for opening a YouTube link
                      // launchUrl(Uri.parse(_recipe.youtubeUrl!));
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
