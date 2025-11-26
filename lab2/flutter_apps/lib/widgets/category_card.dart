import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Color(0xFF6D597A), width: 2),
      ),
      color: Color(0xFFF3D0BD),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            category.imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          category.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF355070),
            fontSize: 18,
            letterSpacing: 0.6,
          ),
        ),
        subtitle: Text(
          category.description.length > 80
              ? '${category.description.substring(0, 80)}...'
              : category.description,
          style: TextStyle(
            color: Color(0xFFB56576),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
