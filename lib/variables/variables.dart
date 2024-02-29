import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_sushi_restaurant/models/cart_item.dart';
import 'package:my_sushi_restaurant/models/food.dart';

TextStyle mainTextStyle(
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.aboreto(
      fontSize: fontSize, fontWeight: fontWeight, color: color);
}

Color mainBackgroundColor = Color.fromARGB(255, 128, 47, 54);

Color buttonBackgroundColor = Color.fromARGB(255, 66, 20, 24);

List<CartItem> cartItems = [];
