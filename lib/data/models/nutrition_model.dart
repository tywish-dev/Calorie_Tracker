// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Nutrition {
  String? id;
  double sugar_g;
  double fiber_g;
  double serving_size_g;
  int sodium_mg;
  String name;
  int potassium_mg;
  double fat_saturated_g;
  double fat_total_g;
  double calories;
  int cholesterol_mg;
  double protein_g;
  double carbohydrates_total_g;
  Nutrition({
    this.id,
    required this.sugar_g,
    required this.fiber_g,
    required this.serving_size_g,
    required this.sodium_mg,
    required this.name,
    required this.potassium_mg,
    required this.fat_saturated_g,
    required this.fat_total_g,
    required this.calories,
    required this.cholesterol_mg,
    required this.protein_g,
    required this.carbohydrates_total_g,
  });

  Nutrition copyWith({
    String? id,
    double? sugar_g,
    double? fiber_g,
    double? serving_size_g,
    int? sodium_mg,
    String? name,
    int? potassium_mg,
    double? fat_saturated_g,
    double? fat_total_g,
    double? calories,
    int? cholesterol_mg,
    double? protein_g,
    double? carbohydrates_total_g,
  }) {
    return Nutrition(
      id: id ?? this.id,
      sugar_g: sugar_g ?? this.sugar_g,
      fiber_g: fiber_g ?? this.fiber_g,
      serving_size_g: serving_size_g ?? this.serving_size_g,
      sodium_mg: sodium_mg ?? this.sodium_mg,
      name: name ?? this.name,
      potassium_mg: potassium_mg ?? this.potassium_mg,
      fat_saturated_g: fat_saturated_g ?? this.fat_saturated_g,
      fat_total_g: fat_total_g ?? this.fat_total_g,
      calories: calories ?? this.calories,
      cholesterol_mg: cholesterol_mg ?? this.cholesterol_mg,
      protein_g: protein_g ?? this.protein_g,
      carbohydrates_total_g:
          carbohydrates_total_g ?? this.carbohydrates_total_g,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sugar_g': sugar_g,
      'fiber_g': fiber_g,
      'serving_size_g': serving_size_g,
      'sodium_mg': sodium_mg,
      'name': name,
      'potassium_mg': potassium_mg,
      'fat_saturated_g': fat_saturated_g,
      'fat_total_g': fat_total_g,
      'calories': calories,
      'cholesterol_mg': cholesterol_mg,
      'protein_g': protein_g,
      'carbohydrates_total_g': carbohydrates_total_g,
    };
  }

  factory Nutrition.fromMap(Map<String, dynamic> map) {
    return Nutrition(
      sugar_g: map['sugar_g'] as double,
      fiber_g: map['fiber_g'] as double,
      serving_size_g: map['serving_size_g'] as double,
      sodium_mg: map['sodium_mg'] as int,
      name: map['name'] as String,
      potassium_mg: map['potassium_mg'] as int,
      fat_saturated_g: map['fat_saturated_g'] as double,
      fat_total_g: map['fat_total_g'] as double,
      calories: map['calories'] as double,
      cholesterol_mg: map['cholesterol_mg'] as int,
      protein_g: map['protein_g'] as double,
      carbohydrates_total_g: map['carbohydrates_total_g'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutrition.fromJson(String source) =>
      Nutrition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Nutrition(id: $id, sugar_g: $sugar_g, fiber_g: $fiber_g, serving_size_g: $serving_size_g, sodium_mg: $sodium_mg, name: $name, potassium_mg: $potassium_mg, fat_saturated_g: $fat_saturated_g, fat_total_g: $fat_total_g, calories: $calories, cholesterol_mg: $cholesterol_mg, protein_g: $protein_g, carbohydrates_total_g: $carbohydrates_total_g)';
  }

  @override
  bool operator ==(covariant Nutrition other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sugar_g == sugar_g &&
        other.fiber_g == fiber_g &&
        other.serving_size_g == serving_size_g &&
        other.sodium_mg == sodium_mg &&
        other.name == name &&
        other.potassium_mg == potassium_mg &&
        other.fat_saturated_g == fat_saturated_g &&
        other.fat_total_g == fat_total_g &&
        other.calories == calories &&
        other.cholesterol_mg == cholesterol_mg &&
        other.protein_g == protein_g &&
        other.carbohydrates_total_g == carbohydrates_total_g;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sugar_g.hashCode ^
        fiber_g.hashCode ^
        serving_size_g.hashCode ^
        sodium_mg.hashCode ^
        name.hashCode ^
        potassium_mg.hashCode ^
        fat_saturated_g.hashCode ^
        fat_total_g.hashCode ^
        calories.hashCode ^
        cholesterol_mg.hashCode ^
        protein_g.hashCode ^
        carbohydrates_total_g.hashCode;
  }
}
