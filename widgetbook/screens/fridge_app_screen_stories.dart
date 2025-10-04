import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/widgets/screens/fridge_app_screen.dart';
import 'package:widgets_to_catalog/models/fridge_item.dart';

// Sample data generators
List<FridgeItem> _generateSampleFridgeItems(int count) {
  final items = <FridgeItem>[];
  final sampleData = [
    ('Milk', '🥛', FoodCategory.dairy, 'Organic Valley'),
    ('Eggs', '🥚', FoodCategory.dairy, null),
    ('Apples', '🍎', FoodCategory.fruits, null),
    ('Carrots', '🥕', FoodCategory.vegetables, null),
    ('Chicken Breast', '🍗', FoodCategory.meat, null),
    ('Orange Juice', '🍊', FoodCategory.beverages, null),
    ('Cheese', '🧀', FoodCategory.dairy, 'Tillamook'),
    ('Bananas', '🍌', FoodCategory.fruits, null),
    ('Yogurt', '🥛', FoodCategory.dairy, 'Greek Gods'),
    ('Leftover Pizza', '🍕', FoodCategory.leftovers, null),
  ];

  for (int i = 0; i < count && i < sampleData.length; i++) {
    final data = sampleData[i];
    items.add(FridgeItem(
      id: '${i + 1}',
      name: data.$1,
      imagePath: data.$2,
      category: data.$3,
      quantity: (i % 5) + 1,
      isFavorite: i % 3 == 0,
      expiryDate: DateTime.now().add(Duration(days: (i % 10) + 1)),
      brand: data.$4,
    ));
  }

  return items;
}

List<ToBuyItem> _generateSampleToBuyItems(int count) {
  final items = <ToBuyItem>[];
  final sampleData = [
    ('Bread', 'Bakery'),
    ('Tomatoes', 'Vegetables'),
    ('Shampoo', null),
    ('Paper Towels', 'Household'),
    ('Avocados', 'Fruits'),
  ];

  for (int i = 0; i < count && i < sampleData.length; i++) {
    final data = sampleData[i];
    items.add(ToBuyItem(
      id: 'buy${i + 1}',
      name: data.$1,
      category: data.$2,
      quantity: (i % 3) + 1,
      isPurchased: i > count * 0.7,
      addedDate: DateTime.now().subtract(Duration(hours: i * 2)),
    ));
  }

  return items;
}

@UseCase(
  name: 'Interactive - Complete App Testing',
  type: FridgeAppScreen,
)
Widget fridgeAppScreenInteractive(BuildContext context) {
  final currentTab = context.knobs.list(
    label: 'Current Tab',
    options: [0, 1],
    initialOption: 0,
    labelBuilder: (index) => index == 0 ? 'My Fridge' : 'To Buy',
  );

  final fridgeItemCount = context.knobs.double.slider(
    label: 'Fridge Items Count',
    initialValue: 10.0,
    max: 10.0,
    min: 0.0,
  ).toInt();

  final toBuyItemCount = context.knobs.double.slider(
    label: 'To Buy Items Count',
    initialValue: 3.0,
    max: 5.0,
    min: 0.0,
  ).toInt();

  final isLoading = context.knobs.boolean(
    label: 'Loading State',
    initialValue: false,
  );

  return FridgeAppScreen(
    initialTabIndex: currentTab,
    fridgeItems: _generateSampleFridgeItems(fridgeItemCount),
    toBuyItems: _generateSampleToBuyItems(toBuyItemCount),
    isLoading: isLoading,
  );
}

@UseCase(
  name: 'First Launch - New User Experience',
  type: FridgeAppScreen,
)
Widget fridgeAppScreenEmpty(BuildContext context) {
  return const FridgeAppScreen(
    initialTabIndex: 0,
    fridgeItems: [],
    toBuyItems: [],
  );
}

@UseCase(
  name: 'Well Stocked - Empty Shopping List',
  type: FridgeAppScreen,
)
Widget fridgeAppScreenEmptyShoppingList(BuildContext context) {
  return FridgeAppScreen(
    initialTabIndex: 1,
    fridgeItems: _generateSampleFridgeItems(5),
    toBuyItems: const [],
  );
}

@UseCase(
  name: 'Loading State - Data Fetching',
  type: FridgeAppScreen,
)
Widget fridgeAppScreenLoading(BuildContext context) {
  return const FridgeAppScreen(
    fridgeItems: [],
    toBuyItems: [],
    isLoading: true,
  );
}

@UseCase(
  name: 'Active Household - Full Data',
  type: FridgeAppScreen,
)
Widget fridgeAppScreenFull(BuildContext context) {
  return FridgeAppScreen(
    fridgeItems: _generateSampleFridgeItems(10),
    toBuyItems: _generateSampleToBuyItems(5),
  );
}

@UseCase(
  name: 'Shopping Mode - To Buy Tab',
  type: FridgeAppScreen,
)
Widget fridgeAppScreenShoppingTab(BuildContext context) {
  return FridgeAppScreen(
    initialTabIndex: 1,
    fridgeItems: _generateSampleFridgeItems(8),
    toBuyItems: _generateSampleToBuyItems(4),
  );
}
