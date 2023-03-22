// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Recipe {
  String title;
  String ingredients;
  String servings;
  String instructions;
  Recipe({
    required this.title,
    required this.ingredients,
    required this.servings,
    required this.instructions,
  });

  Recipe copyWith({
    String? title,
    String? ingredients,
    String? servings,
    String? instructions,
  }) {
    return Recipe(
      title: title ?? this.title,
      ingredients: ingredients ?? this.ingredients,
      servings: servings ?? this.servings,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'ingredients': ingredients,
      'servings': servings,
      'instructions': instructions,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      title: map['title'] as String,
      ingredients: map['ingredients'] as String,
      servings: map['servings'] as String,
      instructions: map['instructions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) =>
      Recipe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Recipe(title: $title, ingredients: $ingredients, servings: $servings, instructions: $instructions)';
  }

  @override
  bool operator ==(covariant Recipe other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.ingredients == ingredients &&
        other.servings == servings &&
        other.instructions == instructions;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        ingredients.hashCode ^
        servings.hashCode ^
        instructions.hashCode;
  }
}
