// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/my_orders.dart';
import 'package:flutter_app_1/Views/product_screen.dart';
import 'package:get/get.dart';

class PaymentDone extends StatelessWidget {
  PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _PayDoneImageWidget(),
            SizedBox(height: 30),
            _PayDoneTotalAmountWidget(),
            SizedBox(height: 30),
            _PayDoneTextWidget(),
            SizedBox(height: 30),
            _PayDoneCompletedWidget(),
            SizedBox(height: 30),
            _PayDoneTrackWidget(context),
          ],
        ),
      ),
    );
  }

Widget _PayDoneTrackWidget(BuildContext context) {
    return Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green.shade400,
            ),
            child: TextButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Myorder()));
              },
              child: _PayDoneTrackTextWidget(),
            ),
          );
  }

Widget _PayDoneTrackTextWidget() {
  return Text(
              'Track Order',
              style: TextStyle(
                fontFamily: 'Mona-Sans',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            );
}

  Widget _PayDoneCompletedWidget() {
    return Text(
            'Your payment is successfully completed',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          );
  }

  Widget _PayDoneTextWidget() {
    return Text(
            'Payment Done',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 1,
            ),
          );
  }

  Widget _PayDoneTotalAmountWidget() {
    return Text(
            '\u{20B9} ${ProductScreen().totalPrice}',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          );
  }

  Widget _PayDoneImageWidget() {
    return Image.asset(
            'assets/payment.png',
            height: 200,
            width: 200,
          );
  }
}
