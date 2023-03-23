// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:calorie_tracker/data/models/nutrition_model.dart';
import 'package:collection/collection.dart';

class UserModel {
  String id;
  String localId;
  String name = "";
  String gender = "";
  int height = 0;
  int age = 0;
  int weight = 0;

  List<Nutrition> foods = [];
  UserModel({
    required this.id,
    required this.localId,
    required this.name,
    required this.gender,
    required this.height,
    required this.age,
    required this.weight,
    required this.foods,
  });

  UserModel copyWith({
    String? id,
    String? localId,
    String? name,
    String? gender,
    int? height,
    int? age,
    int? weight,
    List<Nutrition>? foods,
  }) {
    return UserModel(
      id: id ?? this.id,
      localId: localId ?? this.localId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      foods: foods ?? this.foods,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localId': localId,
      'name': name,
      'gender': gender,
      'height': height,
      'age': age,
      'weight': weight,
      'foods': foods.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      localId: map['localId'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      height: map['height'] as int,
      age: map['age'] as int,
      weight: map['weight'] as int,
      foods: List<Nutrition>.from(
        (map['foods'] as List<int>).map<Nutrition>(
          (x) => Nutrition.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, localId: $localId, name: $name, gender: $gender, height: $height, age: $age, weight: $weight, foods: $foods)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.localId == localId &&
        other.name == name &&
        other.gender == gender &&
        other.height == height &&
        other.age == age &&
        other.weight == weight &&
        listEquals(other.foods, foods);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        localId.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        height.hashCode ^
        age.hashCode ^
        weight.hashCode ^
        foods.hashCode;
  }
}
