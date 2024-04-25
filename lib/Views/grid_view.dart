// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/Controllers/controllers.dart';
import 'package:flutter_app_1/Models/list.dart';
import 'package:get/get.dart';

class GridViewBuilderWidget extends StatelessWidget {
  final MyController controller = Get.put(MyController());

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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        itemCount: getFilteredItems(controller.selectedCategory.value).length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final item = getFilteredItems(controller.selectedCategory.value)[index];
          final itemId = item['item_id'];
          final imagePath = item['image'];
          return _categoryItemCardGridviewWIdget(imagePath, item, itemId, context);
        },
      );
    },
    );
  }

  Widget _categoryItemCardGridviewWIdget(String imagePath, Map<String, dynamic> item, int itemId, BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    _categoryItemImageWidget(imagePath),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            _categoryItemNameWidget(item),
            SizedBox(height: 5),
            _categoryItemQuantityWidget(item),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryItemDiscountpriceWidget(item),
                    SizedBox(height: 5),
                    _categoryItemActualpriceWidget(item),
                  ],
                ),
                Spacer(),
                Obx(
                  () {
                    final itemCount = controller.itemCounts[itemId];
                    return itemCount == null || itemCount == 0
                        ? Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
                            ),
                            child: _categoryItemAddbuttonWidget(
                              itemId,
                              item,
                              context,
                            ),
                          )
                        : Row(
                            children: [
                              _categoryItemMinusWidget(item),
                              _categoryItemCounterWidget(itemCount),
                              _categoryItemPlusButtonWidget(item),
                            ],
                          );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
   Widget _categoryItemCounterWidget(int itemCount) {
    return Text(
      '$itemCount',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _categoryItemPlusButtonWidget(item) {
    return IconButton(
      onPressed: () {
        controller.increment(item['item_id']);
      },
      icon: Container(
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
      ),
      color: Colors.green,
    );
  }

  Widget _categoryItemMinusWidget(item) {
    return IconButton(
      onPressed: () {
        controller.decrement(item['item_id']);
        // controller.removeFromCart(item['item-id']);
      },
      icon: Container(
        height: 30,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: const Color.fromARGB(66, 118, 107, 107),
          ),
        ),
        child: Icon(Icons.remove),
      ),
      color: Colors.green,
    );
  }

  Widget _categoryItemAddbuttonWidget(itemId, item, BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.increment(itemId);
        // controller.addToCart(item, itemId);
       final itemCount = (controller.itemCounts[itemId] ?? 0) + 1;
        controller.addToCart(item);
        print('$itemCount');
      },
      child: Text(
        'Add',
        style: TextStyle(
          fontFamily: 'Mona-Sans',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _categoryItemActualpriceWidget(Map item) {
    return Text(
      '\u{20B9}${item['item_price']}',
      style: TextStyle(
        decoration: TextDecoration.lineThrough,
        fontFamily: 'Mona-Sans',
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _categoryItemDiscountpriceWidget(Map item) {
    return Text(
      '\u{20B9}${item['discount_price']}',
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _categoryItemQuantityWidget(Map item) {
    return Text(
      item['item_quantity'],
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _categoryItemNameWidget(Map item) {
    return Text(
      item['item_name'],
      style: TextStyle(
        fontFamily: 'Mona-Sans',
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _categoryItemImageWidget(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      height: 130,
      width: double.infinity,
    );
  }
}