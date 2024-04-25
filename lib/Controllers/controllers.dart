import 'package:flutter_app_1/Models/list.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var selectedCategory = 'All'.obs;
  var itemCounts = <int, int>{}.obs;
  var itemSpecificCounts = <int, int>{}.obs;
  var cartItems = <Map<String, dynamic>>[].obs;
  

  // Add item to cart
  void addToCart(Map<String, dynamic> item) {
    cartItems.add(item);

  }

  // Category selection
  void onCategoryTapped(String category) {
    selectedCategory.value = category;
  }

  // Increment item count
    
    void increment(int count) {
    itemCounts[count] = (itemCounts[count] ?? 0) + 1;
    update(); 
  }

  // Decrement item count
  void decrement(int count) {
    int itemCount = itemCounts[count] ?? 0;
    if (itemCount > 0) {
      itemCounts[count] = itemCount - 1;
      update(); 
    }
  }
  // Remove item from cart
  void removeFromCart(int itemId) {
    cartItems.removeWhere((item) => item['item_id'] == itemId);
      if (itemCounts.containsKey(itemId) && itemCounts[itemId]! > 0) {
    itemCounts[itemId] = itemCounts[itemId]! - 1;
    update(); // Update the UI
  }
  }

   void onItemRemoved() {
    update(); // Notify GetX to update the widget
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



  
}
