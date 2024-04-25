// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/bnb.dart/wallets.dart';
import 'package:flutter_app_1/Views/my_orders.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _profileAppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _profileCircleAvatarWidget(),
              SizedBox(height: 10),
              _profileNameWidget(),
              SizedBox(height: 7),
              _profileMemberTextWidget(),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: _profileTextButtonWidget(),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 370,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      _profileListTileWidget(context),
                      Divider(),
                      _profileWalletWidget(context),
                      Divider(),
                      _profileLanguagesWidget(),
                      Divider(),
                      _profileReferWidget(),
                      Divider(),
                      _profileLogoutWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileWalletWidget(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.account_balance_wallet_outlined,
        color: Colors.green,
      ),
      title: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wallet()));
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Wallet',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.green,
      ),
    );
  }

  Widget _profileLanguagesWidget() {
    return ListTile(
      leading: Icon(
        Icons.g_translate,
        color: Colors.green,
      ),
      title: Text(
        'Languages',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.green,
      ),
    );
  }

  Widget _profileReferWidget() {
    return ListTile(
      leading: Icon(
        Icons.travel_explore,
        color: Colors.green,
      ),
      title: Text(
        'Refer & Earn',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.green,
      ),
    );
  }

  Widget _profileLogoutWidget() {
    return ListTile(
      leading: Icon(
        Icons.logout,
        color: Colors.green,
      ),
      title: Text(
        'Logout',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.green,
      ),
    );
  }

  Widget _profileListTileWidget(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.check_box_outline_blank_rounded,
        color: Colors.green,
      ),
      title: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Myorder(),
            ),
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Order History',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.green,
      ),
    );
  }

  Widget _profileTextButtonWidget() {
    return TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.edit_square,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              'Edit Profile',
              style: TextStyle(
                fontFamily: 'Mona-Sans',
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ));
  }

  Widget _profileMemberTextWidget() {
    return Text(
      'Member Since July,2023',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
        letterSpacing: 1,
      ),
    );
  }

  Widget _profileNameWidget() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Adithya Vardhan Reddy',
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

  Widget _profileCircleAvatarWidget() {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/avatar.jpg',
          height: 160,
          width: 160,
        ),
      ),
    );
  }

  _profileAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        'My Profile',
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
