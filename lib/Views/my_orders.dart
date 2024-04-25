// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/product_screen.dart';

class Myorder extends StatelessWidget {
  const Myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myOrderAppBarWidget(context),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: _myOrderTextFieldWidget(),
                ),
                SizedBox(width: 10),
                _myOrderSettingsIconWidget(),
              ],
            ),
            SizedBox(height: 10),
            _myOrderCardWidget(),
            SizedBox(height: 10),
            listTileItemBuilder(),
            SizedBox(height: 10),
            listTileItemBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _myOrderCardWidget() {
    return Card(
      color: Colors.white,
      child: Container(
        height: 90,
        width: 500,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            _MyOrderShoppingIconWidget(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _myOrderIdTextWidget(),
                SizedBox(height: 5),
                _myOrderitemTextWidget(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                _myOrderOngoingWidget(),
                SizedBox(height: 5),
                _myOrderDateWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _myOrderDateWidget() {
    return Text(
      'Mon,25 April 2024',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
        letterSpacing: 1,
      ),
    );
  }

  Widget _myOrderOngoingWidget() {
    return Container(
      height: 30,
      width: 75,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 216, 206, 172),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'Ongoing',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.orangeAccent,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _myOrderitemTextWidget() {
    return Text(
      '12 Items',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
        letterSpacing: 1,
      ),
    );
  }

  Widget _myOrderIdTextWidget() {
    return Text(
      'Order ID #0012345',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 1,
      ),
    );
  }

  Widget _MyOrderShoppingIconWidget() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      child: Icon(
        Icons.shopping_bag,
        color: Colors.white,
      ),
    );
  }

  Widget _myOrderSettingsIconWidget() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Icon(
        Icons.display_settings_rounded,
        color: Colors.green,
      ),
    );
  }

  SizedBox _myOrderTextFieldWidget() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_sharp, color: Colors.grey),
          hintText: 'Search by Order  ID',
          hintStyle: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  _myOrderAppBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ProductScreen()));
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Colors.green,
        ),
      ),
      centerTitle: false,
      title: Text(
        'My Orders',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

Widget listTileItemBuilder() {
  return Card(
    color: Colors.white,
    child: Container(
      height: 90,
      width: 500,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Order ID #0012345',
                style: TextStyle(
                  fontFamily: 'Mona-Sans',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '12 Items',
                style: TextStyle(
                  fontFamily: 'Mona-Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                height: 30,
                width: 75,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 200, 241, 202),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Delivery',
                    style: TextStyle(
                      fontFamily: 'Mona-Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Mon,25 April 2024',
                style: TextStyle(
                  fontFamily: 'Mona-Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
