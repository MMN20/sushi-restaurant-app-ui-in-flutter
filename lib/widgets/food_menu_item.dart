import 'package:flutter/material.dart';
import 'package:my_sushi_restaurant/models/food.dart';
import 'package:my_sushi_restaurant/screens/food_details_screen.dart';
import 'package:my_sushi_restaurant/variables/variables.dart';

class FoodMenuItem extends StatelessWidget {
  const FoodMenuItem({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (c) => FoodDetailsScreen(food: food)));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 250,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Center(
              child: Image.asset(
                '${food.imageUrl}',
                fit: BoxFit.fill,
              ),
            )),
            Text(
              '${food.name}',
              style: mainTextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[700]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${food.price}\$',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700]),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      '4.9',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
