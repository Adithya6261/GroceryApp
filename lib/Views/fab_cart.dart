// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/payment_methods.dart';
import 'package:flutter_app_1/Views/product_screen.dart';
import 'package:get/get.dart';

class FABWidget extends StatelessWidget {
  final int itemCount;

  const FABWidget({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 65,
      width: double.infinity,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {},
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _categoryItemFABPriceWidget(),
            SizedBox(width: 60),
            Container(
              height: 40,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: _categoryItemPlaceOrderTextWIdget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryItemPlaceOrderTextWIdget() {
    return TextButton(
      onPressed: () {
        Get.to(Payments());
      },
      child: Row(
        children: [
          Text(
            'Place order',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_rounded,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _categoryItemFABPriceWidget() {
    return Text(
      '$itemCount ${itemCount > 1 ? "items" : "item"} | \u{20B9}${ProductScreen().totalPrice}',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Mona-Sans',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
