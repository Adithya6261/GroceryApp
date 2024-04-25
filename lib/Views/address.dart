// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _categoryItemCardAddressWidget();
  }

  Widget _categoryItemCardAddressWidget() {
    return Card(
      color: Colors.white,
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.white)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _categoryItemTextAddressWidget(),
                  Spacer(),
                  Icon(
                    Icons.edit_square,
                    color: Colors.green,
                    size: 20,
                  )
                ],
              ),
              Row(
                children: [
                  _categoryItemCircleAvatarWidget(),
                  SizedBox(width: 10),
                  _categoryItemHomeTextWidget(),
                ],
              ),
              SizedBox(width: 5),
              _categoryItemAddressTWIdget()
            ],
          ),
        ),
      ),
    );
  }

  Text _categoryItemTextAddressWidget() {
    return Text(
      'Address',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  Widget _categoryItemAddressTWIdget() {
    return Text(
      'Sri Sai Nagar,Ayyappa Society,Madhapur\nTel(50081)',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  Widget _categoryItemHomeTextWidget() {
    return Text(
      'Home',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _categoryItemCircleAvatarWidget() {
    return CircleAvatar(
      maxRadius: 12,
      minRadius: 12,
      child: Icon(
        Icons.home,
        color: Colors.green,
        size: 22,
      ),
    );
  }
}
