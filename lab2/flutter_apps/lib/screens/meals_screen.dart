import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_api_service.dart';
import '../widgets/meal_card.dart';
import 'meal_details_screen.dart';

class MealsScreen extends StatefulWidget {
  final String category;

  MealsScreen({required this.category});

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<Meal> _meals = [];
  List<Meal> _filteredMeals = [];
  bool _isLoading = true;
  final MealApiService apiService = MealApiService();

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    final meals = await apiService.fetchMealsByCategory(widget.category);
    setState(() {
      _meals = meals;
      _filteredMeals = meals;
      _isLoading = false;
    });
  }

  void _searchMeals(String query) async {
    final meals = await apiService.searchMeals(query);
    final filtered = meals.where((m) => m.name.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      _filteredMeals = filtered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAAC8B),
      appBar: AppBar(
        title: Text(
          'Meals - ${widget.category}',
          style: TextStyle(color: Color(0xFFF3D0BD), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFB56576),
        iconTheme: IconThemeData(color: Color(0xFF355070)),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Color(0xFFE56B6F)))
          : Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search meals',
                labelStyle: TextStyle(color: Color(0xFF355070)),
                filled: true,
                fillColor: Color(0xFFF3D0BD),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6D597A), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB56576), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: TextStyle(
                color: Color(0xFF355070),
                fontWeight: FontWeight.w600,
              ),
              onChanged: _searchMeals,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 3 / 4,
              ),
              itemCount: _filteredMeals.length,
              itemBuilder: (ctx, index) {
                final meal = _filteredMeals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealDetailScreen(mealId: meal.id),
                      ),
                    );
                  },
                  child: MealCard(meal: meal),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
