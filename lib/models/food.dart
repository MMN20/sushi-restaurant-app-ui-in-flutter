// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_sushi_restaurant/data_access/data.dart';

class Food {
  String name;
  double price;
  double rating;
  String imageUrl;
  String description;
  Food({
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
  });

  static List<Food> getMenuFood() {
    List<Food> foods = [];
    for (Map<String, dynamic> map in food) {
      foods.add(Food(
          name: map['name'],
          price: map['price'],
          rating: map['rating'],
          imageUrl: map['imageUrl'],
          description: map['description']));
    }
    return foods;
  }

  Food copyWith({
    String? name,
    double? price,
    double? rating,
    String? imageUrl,
    String? description,
  }) {
    return Food(
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'rating': rating,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] as String,
      price: map['price'] as double,
      rating: map['rating'] as double,
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Food(name: $name, price: $price, rating: $rating, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.rating == rating &&
        other.imageUrl == imageUrl &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        imageUrl.hashCode ^
        description.hashCode;
  }
}
