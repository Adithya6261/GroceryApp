// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Controllers/wallet_controller.dart';
import 'package:get/get.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final controller = Get.put(ToggleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _walletAppBarWidget(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _walletImageWidget(),
            SizedBox(height: 30),
            _walletToggleSwitchWidget(),
            SizedBox(height: 20),
            _walletCardWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _walletCardWidget(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: _walletListtileWidget(),
      ),
    );
  }

  Widget _walletListtileWidget() {
    return ListTile(
      leading: CircleAvatar(
        child: Center(
          child: Icon(
            Icons.keyboard_double_arrow_down_rounded,
            color: Colors.red,
          ),
        ),
      ),
      title: _walletTitleTextWidget(),
      subtitle: _walletSubTitleWidget(),
      trailing: _walletTrailingTextWidget(),
    );
  }

  Widget _walletTrailingTextWidget() {
    return Text(
      '- \u{20B9} 4.0',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.red,
        letterSpacing: 1,
      ),
    );
  }

  Widget _walletSubTitleWidget() {
    return Text(
      '25th April 2024,08:00AM',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
        letterSpacing: 1,
      ),
    );
  }

  Widget _walletTitleTextWidget() {
    return Text(
      'Debit',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        letterSpacing: 1,
      ),
    );
  }

  Widget _walletToggleSwitchWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.toggleSwitch(true);
            },
            child: Container(
              height: 70,
              width: 170,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: controller.isDebitSelected.value
                    ? Colors.green
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: _walletDebitTextWidget(),
            ),
          ),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.toggleSwitch(false);
            },
            child: Container(
              height: 70,
              width: 170,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: !controller.isDebitSelected.value
                    ? Colors.green
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: _walletCreditTextWidget(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _walletCreditTextWidget() {
    return Row(
      children: [
        Icon(Icons.arrow_upward_rounded, color: Colors.green),
        SizedBox(width: 5),
        Center(
          child: Text(
            'Credit',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color:
                  controller.isDebitSelected.value ? Colors.grey : Colors.white,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _walletDebitTextWidget() {
    return Row(
      children: [
        Icon(Icons.arrow_downward_rounded, color: Colors.red),
        SizedBox(width: 5),
        Center(
          child: Text(
            'Debit',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color:
                  controller.isDebitSelected.value ? Colors.white : Colors.grey,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _walletImageWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: _walletCoinsImageWidget(),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: _walletAvailBalWidget(),
        ),
        Positioned(
          top: 80,
          left: 20,
          child: _walletAmountTextWidget(),
        ),
        Positioned(
          top: 140,
          left: 40,
          child: _walletAddIconWidget(),
        ),
      ],
    );
  }

  Widget _walletAddIconWidget() {
    return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(255, 57, 130, 91),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
  }

  Widget _walletAmountTextWidget() {
    return Text(
          '\u{20B9} 12,670',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1,
          ),
        );
  }

  Widget _walletAvailBalWidget() {
    return Text(
          'Available Balance',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            letterSpacing: 1,
          ),
        );
  }

  Widget _walletCoinsImageWidget() {
    return Image.asset(
          'assets/coins.png',
          fit: BoxFit.cover,
          width: 350,
          height: 170,
        );
  }

  _walletAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        'My Wallet',
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
