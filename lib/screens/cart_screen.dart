import 'package:flutter/material.dart';
import 'package:my_sushi_restaurant/models/cart_item.dart';
import 'package:my_sushi_restaurant/variables/variables.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView(
              children: [
                ...List.generate(cartItems.length, (index) {
                  CartItem item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: buttonBackgroundColor,
                      leading: Image.asset('${item.food.imageUrl}'),
                      title: Text(
                        '${item.food.name} - (${item.amount})',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Total price: ${item.food.price * item.amount}\$',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          cartItems.remove(item);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: buttonBackgroundColor),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pay Now',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
