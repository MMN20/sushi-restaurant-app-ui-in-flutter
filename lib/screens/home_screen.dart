import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_sushi_restaurant/data_access/data.dart';
import 'package:my_sushi_restaurant/models/food.dart';
import 'package:my_sushi_restaurant/screens/cart_screen.dart';
import 'package:my_sushi_restaurant/variables/variables.dart';
import 'package:my_sushi_restaurant/widgets/food_menu_item.dart';
import 'package:my_sushi_restaurant/widgets/main_card.dart';
import 'package:my_sushi_restaurant/widgets/mytextfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Food> foodMenu = Food.getMenuFood();

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color.fromARGB(255, 222, 222, 228);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tokyo'),
          backgroundColor: backgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainCard(),
                const SizedBox(
                  height: 15,
                ),
                const MyTextField(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Food Menu',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        Food food = foodMenu[index];
                        return FoodMenuItem(
                          food: food,
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Popular Food',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Image.asset(popularFood['imageUrl']),
                    title: Text(
                      '${popularFood['name']}',
                      style: mainTextStyle(
                          fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text('${popularFood['price']}\$'),
                    trailing: Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
