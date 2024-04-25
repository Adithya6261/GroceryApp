// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Views/bnb.dart/grocery.dart';
import 'package:flutter_app_1/Views/product_screen.dart';
import 'package:get/get.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
   final List<Map<String, dynamic>> _Categories = [
    {
      'image': 'assets/rice.jpg',
      'text': 'Atta, Rice &\n Dals',
    },
    {
      'image': 'assets/heritage1.jpg',
      'text': 'Dairy &\nBreakfast',
    },
    {
      'image': 'assets/coke.jpg',
      'text': 'Cool drinks &\n Juices',
    },
    {
      'image': 'assets/vegetables.jpg',
      'text': 'Vegetables &\nFruits',
    },
    {
      'image': 'assets/frozenfoods.jpg',
      'text': 'Instant &\nFrozen Foods',
    },
    {
      'image': 'assets/dryfruits.jpg',
      'text': 'Dryfruits,Oils \n& masalas',
    },
    {
      'image': 'assets/electronics.jpg',
      'text': 'Electronics &\nAccessories',
    },
    {
      'image': 'assets/meat.jpg',
      'text': 'Chicken,\nMeat & Fish',
    },
    {
      'image': 'assets/beautycare.jpg',
      'text': 'Health & \n Beauty Care',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Categories',
            style: TextStyle(
              fontFamily: 'Mona-Sans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body:  GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _Categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Color.fromARGB(255, 243, 243, 240),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(_Categories[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              _Categories[index]['text'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Mona-Sans',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
