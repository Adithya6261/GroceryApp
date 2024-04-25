// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_app_1/Controllers/controllers.dart';
import 'package:flutter_app_1/Views/fab_button.dart';
import 'package:flutter_app_1/Views/cart_screen.dart';
import 'package:flutter_app_1/Models/list.dart';
import 'package:get/get.dart';
import 'package:flutter_app_1/Views/grid_view.dart';


// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  final MyController controller = Get.put(MyController());

  ProductScreen({super.key});

  // ITEMS ADD TO CART
  // void addToCart(BuildContext context, int items, int itemCount) {
  //   controller.addToCart(items, itemCount);
  // }
// PRICE CALCULATE

  double get totalPrice {
    double total = 0;
    controller.itemCounts.forEach(
      (itemId, count) {
        final item = getItemById(itemId);
        if (item != null) {
          final itemDiscountPrice = item['discount_price'];
          final itemPrice = double.tryParse(itemDiscountPrice) ?? 0;
          total += itemPrice * count;
        }
      },
    );
    return total;
  }

  // DISPLAY ITEMS BY ID
  Map<String, dynamic>? getItemById(int itemId) {
    for (var category in items) {
      for (var item in category['category_item']) {
        if (item['item_id'] == itemId) {
          return item;
        }
      }
    }
    return null;
  }

  List<dynamic> getFilteredItems(String selectedCategory) {
    if (selectedCategory == 'All') {
      return items.expand((category) => category['category_item']).toList();
    } else {
      var category = items.firstWhere(
        (category) =>
            category['category_name'].toLowerCase() ==
            selectedCategory.toLowerCase(),
        orElse: () => {'category_item': []},
      );
      return category['category_item'];
    }
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR //

      appBar: _CategoryItemAppBarProductScreenWidget(),

      // BODY STARTS HERE //
      body: Stack(
        children: [
          // CUSTOMSCROLLVIEW //

          CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 90, top: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // CATEGORIES //

                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (String category in [
                                'All',
                                'milk',
                                'Biscuits',
                                'Chocolate',
                              ])
                                GestureDetector(
                                  onTap: () {
                                    controller.onCategoryTapped(category);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: category ==
                                              controller.selectedCategory.value
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.green),
                                    ),
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                        color: category ==
                                                controller
                                                    .selectedCategory.value
                                            ? Colors.white60
                                            : Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          )),

                      // GRIDVIEW BUILDER STARTS HERE  //

                      SizedBox(height: 10),
                       GridViewBuilderWidget(),

                      // GRIDVIEW BUILDER ENDS HERE
                    ],
                  ),
                ),
              ),
            ],
          ),

          // CUSTOMSCROLLVIEW ENDS HERE
        ],
      ),

      //  FLOATINGACTIONBUTTON    //

      floatingActionButton: Obx(
        () => _CategoryItemFABWidget(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

 

  _CategoryItemAppBarProductScreenWidget() {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.white60,
      leading: IconButton(
        onPressed: () {
          //  Navigator.pop(context);
          Get.back();
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
      title: Row(
        children: [
          Image.asset('assets/products.png', height: 50, width: 50),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Dairy & Breakfast',
                    style: TextStyle(
                      fontFamily: 'Mona-Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.green),
                ],
              ),
              Text(
                '  Delivery in 20mins',
                style: TextStyle(
                  fontFamily: 'Mona-Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.search),
          ),
        ),
      ],
    );
  }

  //  WIDGETS  //

  Widget _CategoryItemFABWidget(BuildContext context) {
    return Visibility(
      visible: controller.itemCounts.isNotEmpty,
      child: FAB(
        itemCount: controller.itemCounts.length,
        totalPrice: totalPrice,
        onItemRemoved: () {
          if (controller.itemCounts.isNotEmpty) {
            final item = getFilteredItems(controller.selectedCategory.value)[index];
            
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(
                  itemCount: controller.itemCounts[item['item_id']] ?? 0,
                  itemDetails: item,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
