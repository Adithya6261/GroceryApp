// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Controllers/payment_controller.dart';
import 'package:flutter_app_1/Views/payment_done.dart';
import 'package:get/get.dart';

class Payments extends StatelessWidget {
  Payments({Key? key}) : super(key: key);

  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _categoryItemAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _categortItemPaymentTextWidget(),
                  ),
                  SizedBox(height: 10),
                  _categoryItemCardImageWidget(),
                  _categoryItemSeamlessTextWidget(),
                  SizedBox(height: 20),
                  _categoryItemWalletTextWidget(),
                  Card(
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: _categoryItemListTileWidget(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _categoryItemPayTextWidget(),
                  ),
                  SizedBox(height: 10),
                  _categoryItemCardWidget(context),
                  SizedBox(height: 20),
                  _categoryItemUpiPaymentWidget(),
                  Card(
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          _categoryItemGpayWidget(),
                          Divider(
                            endIndent: 8,
                            indent: 8,
                          ),
                          Spacer(),
                          _categoryItemPhonepeWidget(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _categoryItemNoteWidget(),
                  ),
                  SizedBox(height: 50),
                  _categoryItemPayButtonWidget(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryItemCardWidget(BuildContext context) {
    return Card(
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: _categoryItemCashListtileWidget(),
      ),
    );
  }

  Widget _categortItemPaymentTextWidget() {
    return Text(
      'Payment method',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 1,
      ),
    );
  }

  Widget _categoryItemCardImageWidget() {
    return Row(
      children: [
        Image.asset(
          'assets/card.jpg',
          height: 30,
          width: 30,
        ),
        Text(
          'Choose your preferred payment method for a',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _categoryItemSeamlessTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'seamless payment experience',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _categoryItemWalletTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Wallet',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _categoryItemUpiPaymentWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'UPI Payments',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _categoryItemPayButtonWidget(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      child: Center(
          child: TextButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDone()));
        },
        child: Text(
          'Pay',
          style: TextStyle(
            fontFamily: 'Mona-Sans',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      )),
    );
  }

  Widget _categoryItemNoteWidget() {
    return Text(
      'Note:Do not go back while payment is processing',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }

  Widget _categoryItemPhonepeWidget() {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: _categoryItemPhonepeImageWidget(),
      ),
      title: _categoryItemPhonepeTextWidget(),
      trailing: Obx(
        () => Radio(
          activeColor: Colors.green,
          value: 4,
          groupValue: controller.selectedOption.value,
          onChanged: (value) {
            controller.selectedOption.value = value!;
          },
        ),
      ),
    );
  }

  Widget _categoryItemPhonepeTextWidget() {
    return Text(
      'Phone Pe',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemPhonepeImageWidget() {
    return Center(
          child: Image.asset(
        'assets/phonepe.jpg',
        height: 25,
        width: 25,
      ));
  }

  Widget _categoryItemGpayWidget() {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: _categoryItemGpayImageWidget(),
      ),
      title: _categoryItemGpayTextWidget(),
      trailing: Obx(
        () => Radio(
          activeColor: Colors.green,
          value: 3,
          groupValue: controller.selectedOption.value,
          onChanged: (value) {
            controller.selectedOption.value = value!;
          },
        ),
      ),
    );
  }

  Widget _categoryItemGpayTextWidget() {
    return Text(
      'Google Pay',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

Widget _categoryItemGpayImageWidget() {
    return Center(
          child: Image.asset(
        'assets/gpay.jpg',
        height: 25,
        width: 25,
      ));
  }

  _categoryItemAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.green,
        ),
      ),
      centerTitle: false,
      title: Text(
        'Payment',
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

  Widget _categoryItemCashListtileWidget() {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Center(
          child: _categoryItemMoneyIconWidget(),
        ),
      ),
      title: _categoryItemCashTitleWidget(),
      trailing: Obx(
        () => Radio(
          activeColor: Colors.green,
          value: 2,
          groupValue: controller.selectedOption.value,
          onChanged: (value) {
            controller.selectedOption.value = value!;
          },
        ),
      ),
    );
  }

  Widget _categoryItemMoneyIconWidget() {
    return Icon(
          Icons.money_rounded,
          color: Colors.green,
          size: 30,
        );
  }

  Widget _categoryItemCashTitleWidget() {
    return Text(
      'Cash Payment',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemPayTextWidget() {
    return Text(
      'Pay on Delivery',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _categoryItemListTileWidget() {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: _categoryItemIconBalanceWalletWidget(),
      ),
      title: _categoryItemWalletTitleWidget(),
      subtitle: _categoryItemBalanceSubtitleWidget(),
      trailing: Obx(
        () => Radio(
          activeColor: Colors.green,
          value: 1,
          groupValue: controller.selectedOption.value,
          onChanged: (value) {
            controller.selectedOption.value = value!;
          },
        ),
      ),
    );
  }

  Widget _categoryItemIconBalanceWalletWidget() {
    return Center(
        child: Icon(
          Icons.account_balance_wallet,
          color: Colors.green,
          size: 35,
        ),
      );
  }

  Widget _categoryItemBalanceSubtitleWidget() {
    return Text(
      'Balance:\u{20B9} 1000',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
        color: Colors.grey,
      ),
    );
  }

  Widget _categoryItemWalletTitleWidget() {
    return Text(
      'My wallet',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
