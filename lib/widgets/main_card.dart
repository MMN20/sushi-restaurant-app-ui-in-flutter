import 'package:flutter/material.dart';
import 'package:my_sushi_restaurant/variables/variables.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: mainBackgroundColor,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  'Get 32% Promo',
                  style: mainTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text('Redeem'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      foregroundColor: Colors.white,
                      backgroundColor: buttonBackgroundColor),
                )
              ],
            ),
            SizedBox(
              height: 100,
              child: Image.asset(
                'assets/images/many_sushi.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
