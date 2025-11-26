class Meal {
  final String id;
  final String name;
  final String thumbnailUrl;

  Meal({required this.id, required this.name, required this.thumbnailUrl});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnailUrl: json['strMealThumb'],
    );
  }
}
