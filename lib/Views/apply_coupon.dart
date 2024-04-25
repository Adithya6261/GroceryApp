// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CouponTextField extends StatelessWidget {
  const CouponTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _categoryItemTextFieldItemCouponWidget(),
    );
  }

  Widget _categoryItemTextFieldItemCouponWidget() {
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        hintText: 'coupon?',
        hintStyle: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 17,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: _categoryTextButtonItemCouponWidget(context),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _categoryTextButtonItemCouponWidget(BuildContext context) {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('You have saved 20 rupees'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 100, left: 10, right: 10),
          ),
        );
      },
      child: Text(
        'Apply Coupon',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
