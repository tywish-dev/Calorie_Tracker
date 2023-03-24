// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'nutrition_model.dart';

class UserModel {
  String? id;
  String? localId;
  String? name;
  String? gender;
  int? height;
  int? age;
  int? weight;

  List<Nutrition>? breakfast = [];
  List<Nutrition>? lunch = [];
  List<Nutrition>? dinner = [];
  UserModel({
    this.id,
    this.localId,
    this.name,
    this.gender,
    this.height,
    this.age,
    this.weight,
    this.breakfast,
    this.lunch,
    this.dinner,
  });

  UserModel copyWith({
    String? id,
    String? localId,
    String? name,
    String? gender,
    int? height,
    int? age,
    int? weight,
    List<Nutrition>? breakfast,
    List<Nutrition>? lunch,
    List<Nutrition>? dinner,
  }) {
    return UserModel(
      id: id ?? this.id,
      localId: localId ?? this.localId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
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
      'breakfast': breakfast!.map((x) => x.toMap()).toList(),
      'lunch': lunch!.map((x) => x.toMap()).toList(),
      'dinner': dinner!.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      localId: map['localId'] != null ? map['localId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      height: map['height'] != null ? map['height'] as int : null,
      age: map['age'] != null ? map['age'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      breakfast: map['breakfast'] != null
          ? List<Nutrition>.from(
              (map['breakfast'] as List<int>).map<Nutrition?>(
                (x) => Nutrition.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      lunch: map['lunch'] != null
          ? List<Nutrition>.from(
              (map['lunch'] as List<int>).map<Nutrition?>(
                (x) => Nutrition.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      dinner: map['dinner'] != null
          ? List<Nutrition>.from(
              (map['dinner'] as List<int>).map<Nutrition?>(
                (x) => Nutrition.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, localId: $localId, name: $name, gender: $gender, height: $height, age: $age, weight: $weight, breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
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
        listEquals(other.breakfast, breakfast) &&
        listEquals(other.lunch, lunch) &&
        listEquals(other.dinner, dinner);
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
        breakfast.hashCode ^
        lunch.hashCode ^
        dinner.hashCode;
  }
}
