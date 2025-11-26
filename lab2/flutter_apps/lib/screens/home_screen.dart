import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/meal_api_service.dart';
import '../widgets/category_card.dart';
import 'meals_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> _categories = [];
  List<Category> _filteredCategories = [];
  bool _isLoading = true;
  final MealApiService apiService = MealApiService();

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final categories = await apiService.fetchCategories();
    setState(() {
      _categories = categories;
      _filteredCategories = categories;
      _isLoading = false;
    });
  }

  void _searchCategories(String query) {
    final filtered = _categories.where((cat) =>
        cat.name.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      _filteredCategories = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Categories'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search categories',
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
              onChanged: _searchCategories,
            )

          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCategories.length,
              itemBuilder: (ctx, index) {
                final category = _filteredCategories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealsScreen(category: category.name),
                      ),
                    );
                  },
                  child: CategoryCard(category: category),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
