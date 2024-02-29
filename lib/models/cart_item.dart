// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_sushi_restaurant/models/food.dart';

class CartItem {
  Food food;
  int amount;
  CartItem({
    required this.food,
    required this.amount,
  });
}
