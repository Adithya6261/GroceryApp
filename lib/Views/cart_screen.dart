// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Controllers/controllers.dart';
import 'package:flutter_app_1/Views/bill_details.dart';
import 'package:flutter_app_1/Views/fab_cart.dart';
import 'package:flutter_app_1/views/address.dart';
import 'package:flutter_app_1/views/apply_coupon.dart';
import 'package:get/get.dart';
class Cart extends StatefulWidget {
  final Map<String, dynamic> itemDetails;
  final int itemCount;

  Cart({Key? key, required this.itemCount, required this.itemDetails})
      : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final controller = Get.put(MyController());

  int count = 0;

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  void decrementCounter() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  APPBAR  //

      appBar: _categoryItemAppBarWIdget(context),

      //  BODY STARTS HERE  //

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  //  LISTVIEW BUILDER  //

                  _categoryItemListviewWidget(),

                  // LISTVIEW BUILDER ENDS HERE  //
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 10, right: 10),

              // APPLY COUPON TEXT FIELD  //

              child: CouponTextField(),
            ),

            // BILL DETAILS //

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _categoryItemTextWidget(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BillDetails(),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 140, left: 10, right: 10),
              child: AddressWidget(),
            ),
          ],
        ),
      ),

      floatingActionButton: FABWidget(itemCount: controller.cartItems.length),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _categoryItemAppBarWIdget(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 1,
      backgroundColor: Colors.white60,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(Icons.arrow_back),
        ),
        color: Colors.green,
      ),
      centerTitle: false,
      title: Align(
        alignment: Alignment.centerLeft,
        child: _categoryItemTitleAppbarWIdget(),
      ),
    );
  }

  Widget _categoryItemTitleAppbarWIdget() {
    return Text(
      'Checkout',
      style: TextStyle(
          fontFamily: 'Mona-Sans', fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  Widget _categoryItemListviewWidget() {
    // List<Map<String, dynamic>> uniqueItems =
    //     controller.cartItems.toSet().toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.cartItems.length,
      itemBuilder: (context, index) {
        final Map<String, dynamic> currentItem = controller.cartItems[index];

        return Card(
          child: Container(
            height: 100,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    _categoryItemImageWidget(currentItem),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _categoryItemNameWidget(currentItem),
                        _categoryItemQuantityWidget(currentItem),
                        _categoryItemPriceWidget(currentItem, index),
                      ],
                    ),
                    Spacer(),
                    _categoryItemMinusDecrementWidget(index),
                    _categoryItemCounterNumsWidget(index),
                    _categortItemAddIncrementWidget(index),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _categoryItemMinusDecrementWidget(int index) {
    return IconButton(
      onPressed: () {
        controller.decrement(controller.cartItems[index]['item_id']);
        decrementCounter();
      },
      icon: _categoryItemRemoveDecrementWidget(),
      color: Colors.green,
    );
  }

  Widget _categoryItemRemoveDecrementWidget() {
    return Container(
      height: 30,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color.fromARGB(66, 118, 107, 107),
        ),
      ),
      child: Icon(Icons.remove),
    );
  }

  Widget _categoryItemCounterNumsWidget(int index) {
    final count = controller.cartItems[index]['item_id'];
    final itemCount = controller.itemCounts[count] ?? 0;
    return Text(
      '$itemCount',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _categortItemAddIncrementWidget(int index) {
    return IconButton(
      onPressed: () {
        controller.increment(controller.cartItems[index]['item_id']);
        incrementCounter();
      },
      icon: _categoryItemAddContainerWidget(),
      color: Colors.green,
    );
  }

  Widget _categoryItemAddContainerWidget() {
    return Container(
      height: 30,
      width: 35,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 217, 232, 218),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.green),
      ),
      child: Icon(
        Icons.add,
      ),
    );
  }

  Widget _categoryItemTextWidget() {
    return Text(
      'Bill Details',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemPriceWidget(Map<String, dynamic> currentItem, int index) {
    final count = controller.cartItems[index]['item_id'];
    final counts = controller.itemCounts[count] ?? 0;
    final price =double.parse(currentItem['discount_price']).toStringAsFixed(2);

    return RichText(
      text: TextSpan(
          text: '$counts  * ',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: ' \u{20B9} $price',
              style: TextStyle(
                fontFamily: 'Mona-Sans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),
            ),
          ],
          ),
    );
  }

  Widget _categoryItemQuantityWidget(Map<String, dynamic> currentItem) {
    return Text(
      currentItem['item_quantity'],
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }

  Widget _categoryItemNameWidget(Map<String, dynamic> currentItem) {
    return Text(
      currentItem['item_name'],
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _categoryItemImageWidget(Map<String, dynamic> currentItem) {
    return Image.asset(
      currentItem['image'],
      height: 70,
      width: 70,
      fit: BoxFit.cover,
    );
  }
}
