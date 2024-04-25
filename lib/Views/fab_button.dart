// cart_floating_action_button.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/product_screen.dart';

class FAB extends StatelessWidget {
  final int itemCount;
  final double totalPrice;
   final VoidCallback onItemRemoved;

  const FAB({
    Key? key,
    required this.itemCount,
    required this.totalPrice,
    required this.onItemRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 65,
      width: double.infinity,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: onItemRemoved,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
               '$itemCount ${itemCount > 1 ? "items" : "item"} | \u{20B9}${ProductScreen().totalPrice}',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Mona-Sans',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 80),
            Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextButton(
                  onPressed: onItemRemoved, 
                  child: Text(
                    'View Cart',
                    style: TextStyle(
                      fontFamily: 'Mona-Sans',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.green
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
