import 'package:flutter/material.dart';
import 'package:my_sushi_restaurant/models/cart_item.dart';
import 'package:my_sushi_restaurant/models/food.dart';
import 'package:my_sushi_restaurant/variables/variables.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({super.key, required this.food});
  final Food food;
  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 228),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(child: Image.asset('${widget.food.imageUrl}')),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '${widget.food.rating}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${widget.food.name}',
                            style: mainTextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${widget.food.description}'),
                          SizedBox(
                            height: 200,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomWidget()
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 180,
        decoration: BoxDecoration(color: mainBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${widget.food.price}\$',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (amount > 0) {
                              amount--;
                              setState(() {});
                            }
                          },
                          icon: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: buttonBackgroundColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          )),
                      Text(
                        '$amount',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            amount++;
                            setState(() {});
                          },
                          icon: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: buttonBackgroundColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: buttonBackgroundColor,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    if (amount > 0) {
                      cartItems
                          .add(CartItem(food: widget.food, amount: amount));
                      showDialog(
                          context: context,
                          builder: (c) {
                            return AlertDialog(
                              backgroundColor: mainBackgroundColor,
                              title: const Text(
                                'The item was successfully added to cart!',
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (c) {
                            return AlertDialog(
                              backgroundColor: mainBackgroundColor,
                              title: const Text(
                                'Please select the amount first',
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to card',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward_outlined)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
