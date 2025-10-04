import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/models/fridge_item.dart';
import 'package:widgets_to_catalog/widgets/cards/fridge_item_card.dart';
import '../common/scaffold_wrapper.dart';

@UseCase(
  name: 'Interactive - Customize Item',
  type: FridgeItemCard,
)
Widget fridgeItemCardInteractive(BuildContext context) {
  final itemName = context.knobs.string(
    label: 'Item Name',
    initialValue: 'Milk',
  );

  final brand = context.knobs.stringOrNull(
    label: 'Brand (optional)',
    initialValue: 'Organic Valley',
  );

  final emoji = context.knobs.list(
    label: 'Emoji',
    options: ['🥛', '🥚', '🍎', '🥕', '🍗', '🍊', '🧀', '🍌'],
    initialOption: '🥛',
  );

  final category = context.knobs.list(
    label: 'Category',
    options: FoodCategory.values,
    initialOption: FoodCategory.dairy,
    labelBuilder: (category) => category.toString().split('.').last,
  );

  final quantity = context.knobs.double.slider(
    label: 'Quantity',
    initialValue: 2.0,
    max: 20.0,
    min: 0.0,
  ).toInt();

  final isFavorite = context.knobs.boolean(
    label: 'Is Favorite',
    initialValue: false,
  );

  final expiryOption = context.knobs.list(
    label: 'Expiry Status',
    options: ['None', 'Expired', 'Expiring Soon', 'Normal'],
    initialOption: 'Normal',
  );

  DateTime? expiryDate;
  switch (expiryOption) {
    case 'Expired':
      expiryDate = DateTime.now().subtract(const Duration(days: 1));
      break;
    case 'Expiring Soon':
      expiryDate = DateTime.now().add(const Duration(days: 2));
      break;
    case 'Normal':
      expiryDate = DateTime.now().add(const Duration(days: 7));
      break;
    case 'None':
    default:
      expiryDate = null;
      break;
  }

  return wrapInScaffold(
    FridgeItemCard(
      item: FridgeItem(
        id: '1',
        name: itemName,
        imagePath: emoji,
        category: category,
        quantity: quantity,
        isFavorite: isFavorite,
        expiryDate: expiryDate,
        brand: brand?.isNotEmpty == true ? brand : null,
      ),
      onFavoriteToggle: () {},
      onBuyMore: () {},
      onQuantityChanged: () {},
    ),
    title: 'Fridge Item Card',
  );
}

@UseCase(
  name: 'Expired Item - Requires Attention',
  type: FridgeItemCard,
)
Widget fridgeItemCardExpired(BuildContext context) {
  return wrapInScaffold(
    FridgeItemCard(
      item: FridgeItem(
        id: '2',
        name: 'Leftover Pizza',
        imagePath: '🍕',
        category: FoodCategory.leftovers,
        quantity: 3,
        isFavorite: false,
        expiryDate: DateTime.now().subtract(const Duration(days: 1)),
      ),
      onFavoriteToggle: () {},
      onBuyMore: () {},
      onQuantityChanged: () {},
    ),
    title: 'Fridge Item Card',
  );
}

@UseCase(
  name: 'Empty Item - Needs Restocking',
  type: FridgeItemCard,
)
Widget fridgeItemCardZeroQuantity(BuildContext context) {
  return wrapInScaffold(
    FridgeItemCard(
      item: FridgeItem(
        id: '3',
        name: 'Empty Milk Carton',
        imagePath: '🥛',
        category: FoodCategory.dairy,
        quantity: 0,
        isFavorite: false,
        expiryDate: DateTime.now().add(const Duration(days: 5)),
      ),
      onFavoriteToggle: () {},
      onBuyMore: () {},
      onQuantityChanged: () {},
    ),
    title: 'Fridge Item Card',
  );
}

@UseCase(
  name: 'Favorite Item - Priority Display',
  type: FridgeItemCard,
)
Widget fridgeItemCardFavorite(BuildContext context) {
  return wrapInScaffold(
    FridgeItemCard(
      item: FridgeItem(
        id: '4',
        name: 'Greek Yogurt',
        imagePath: '🥛',
        category: FoodCategory.dairy,
        quantity: 2,
        isFavorite: true,
        expiryDate: DateTime.now().add(const Duration(days: 7)),
        brand: 'Greek Gods',
      ),
      onFavoriteToggle: () {},
      onBuyMore: () {},
      onQuantityChanged: () {},
    ),
    title: 'Fridge Item Card',
  );
}

@UseCase(
  name: 'Expiring Soon - Use First Warning',
  type: FridgeItemCard,
)
Widget fridgeItemCardExpiringSoon(BuildContext context) {
  return wrapInScaffold(
    FridgeItemCard(
      item: FridgeItem(
        id: '5',
        name: 'Bananas',
        imagePath: '🍌',
        category: FoodCategory.fruits,
        quantity: 6,
        isFavorite: false,
        expiryDate: DateTime.now().add(const Duration(days: 2)),
      ),
      onFavoriteToggle: () {},
      onBuyMore: () {},
      onQuantityChanged: () {},
    ),
    title: 'Fridge Item Card',
  );
}

@UseCase(
  name: 'Fresh Item - Perfect Condition',
  type: FridgeItemCard,
)
Widget fridgeItemCardFresh(BuildContext context) {
  return wrapInScaffold(
    FridgeItemCard(
      item: FridgeItem(
        id: '6',
        name: 'Chicken Breast',
        imagePath: '🍗',
        category: FoodCategory.meat,
        quantity: 4,
        isFavorite: false,
        expiryDate: DateTime.now().add(const Duration(days: 10)),
      ),
      onFavoriteToggle: () {},
      onBuyMore: () {},
      onQuantityChanged: () {},
    ),
    title: 'Fridge Item Card',
  );
}

@UseCase(
  name: 'High Quantity - Well Stocked',
  type: FridgeItemCard,
)
Widget fridgeItemCardHighQuantity(BuildContext context) {
  return wrapInScaffold(
    FridgeItemCard(
      item: FridgeItem(
        id: '7',
        name: 'Eggs',
        imagePath: '🥚',
        category: FoodCategory.dairy,
        quantity: 12,
        isFavorite: true,
        expiryDate: DateTime.now().add(const Duration(days: 14)),
      ),
      onFavoriteToggle: () {},
      onBuyMore: () {},
      onQuantityChanged: () {},
    ),
    title: 'Fridge Item Card',
  );
}
