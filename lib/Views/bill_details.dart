// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/product_screen.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _categoryItemBillWidget();
  }

  Widget _categoryItemBillWidget() {
    return _categoryItemCardBillWIdget();
  }

  Widget _categoryItemCardBillWIdget() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item Total',
                  style: TextStyle(
                    fontFamily: 'Mona-Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                _categoryItemRIchTextBillWIdget()
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryItemDeliveryTextBillWidget(),
                _categoryItemFreeTextBillWIdget(),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              indent: 8,
              endIndent: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryItemCouponTextBillWidget(),
                _categoryItemRupeesBillWidget(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryItemTaxBillWidget(),
                _categoryItemTenRupeeBillWidget(),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              indent: 8,
              endIndent: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryItemToPayBillWidget(),
                _categoryItemRIchText1BillWIdget()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryItemRIchText1BillWIdget() {
    return RichText(
      text: TextSpan(
          text: '\u{20B9}',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          children: [
            TextSpan(
              text: ' ${ProductScreen().totalPrice}',
              style: TextStyle(
                fontFamily: 'Mona-Sans',
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            )
          ]),
    );
  }

  Widget _categoryItemToPayBillWidget() {
    return Text(
      'To Pay',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemTenRupeeBillWidget() {
    return Text(
      '\u{20B9}10.00',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemTaxBillWidget() {
    return Text(
      'Taxes and Charges',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemRupeesBillWidget() {
    return Text(
      '- \u{20B9}10.00',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.red,
      ),
    );
  }

  Widget _categoryItemCouponTextBillWidget() {
    return Text(
      'Coupon code',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemFreeTextBillWIdget() {
    return Text(
      'Free',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.green,
      ),
    );
  }

  Widget _categoryItemDeliveryTextBillWidget() {
    return Text(
      'Delivery Fee',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  Widget _categoryItemRIchTextBillWIdget() {
    return RichText(
      text: TextSpan(
          text: '\u{20B9}',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          children: [
            TextSpan(
              text: ' ${ProductScreen().totalPrice}',
              style: TextStyle(
                fontFamily: 'Mona-Sans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            )
          ]),
    );
  }
}
