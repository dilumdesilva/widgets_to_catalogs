import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/models/fridge_item.dart';
import 'package:widgets_to_catalog/widgets/cards/to_buy_item_card.dart';
import '../common/scaffold_wrapper.dart';

@UseCase(
  name: 'Interactive - Customize Shopping Item',
  type: ToBuyItemCard,
)
Widget toBuyItemCardInteractive(BuildContext context) {
  final itemName = context.knobs.string(
    label: 'Item Name',
    initialValue: 'Bread',
  );

  final category = context.knobs.stringOrNull(
    label: 'Category (optional)',
    initialValue: 'Bakery',
  );

  final quantity = context.knobs.double.slider(
    label: 'Quantity',
    initialValue: 2.0,
    max: 20.0,
    min: 1.0,
  ).toInt();

  final isPurchased = context.knobs.boolean(
    label: 'Is Purchased',
    initialValue: false,
  );

  final timeOption = context.knobs.list(
    label: 'Added Time',
    options: ['Just now', '30 minutes ago', '2 hours ago', '1 day ago', '3 days ago'],
    initialOption: '1 day ago',
  );

  DateTime addedDate;
  switch (timeOption) {
    case 'Just now':
      addedDate = DateTime.now();
      break;
    case '30 minutes ago':
      addedDate = DateTime.now().subtract(const Duration(minutes: 30));
      break;
    case '2 hours ago':
      addedDate = DateTime.now().subtract(const Duration(hours: 2));
      break;
    case '1 day ago':
      addedDate = DateTime.now().subtract(const Duration(days: 1));
      break;
    case '3 days ago':
      addedDate = DateTime.now().subtract(const Duration(days: 3));
      break;
    default:
      addedDate = DateTime.now().subtract(const Duration(days: 1));
      break;
  }

  return wrapInScaffold(
    ToBuyItemCard(
      item: ToBuyItem(
        id: '1',
        name: itemName,
        category: category?.isNotEmpty == true ? category : null,
        quantity: quantity,
        isPurchased: isPurchased,
        addedDate: addedDate,
      ),
      onTogglePurchased: () {},
      onRemove: () {},
      onQuantityChanged: () {},
    ),
    title: 'To Buy Item Card',
  );
}

@UseCase(
  name: 'Recently Added - Fresh Addition',
  type: ToBuyItemCard,
)
Widget toBuyItemCardRecentlyAdded(BuildContext context) {
  return wrapInScaffold(
    ToBuyItemCard(
      item: ToBuyItem(
        id: '2',
        name: 'Avocados',
        category: 'Fruits',
        quantity: 3,
        isPurchased: false,
        addedDate: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      onTogglePurchased: () {},
      onRemove: () {},
      onQuantityChanged: () {},
    ),
    title: 'To Buy Item Card',
  );
}

@UseCase(
  name: 'Bulk Purchase - High Quantity',
  type: ToBuyItemCard,
)
Widget toBuyItemCardHighQuantity(BuildContext context) {
  return wrapInScaffold(
    ToBuyItemCard(
      item: ToBuyItem(
        id: '3',
        name: 'Paper Towels',
        category: 'Household',
        quantity: 12,
        isPurchased: false,
        addedDate: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      onTogglePurchased: () {},
      onRemove: () {},
      onQuantityChanged: () {},
    ),
    title: 'To Buy Item Card',
  );
}

@UseCase(
  name: 'Purchased Item - Completed',
  type: ToBuyItemCard,
)
Widget toBuyItemCardPurchased(BuildContext context) {
  return wrapInScaffold(
    ToBuyItemCard(
      item: ToBuyItem(
        id: '4',
        name: 'Bread',
        category: 'Bakery',
        quantity: 2,
        isPurchased: true,
        addedDate: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      onTogglePurchased: () {},
      onRemove: () {},
      onQuantityChanged: () {},
    ),
    title: 'To Buy Item Card',
  );
}

@UseCase(
  name: 'Urgent Item - Old Addition',
  type: ToBuyItemCard,
)
Widget toBuyItemCardUrgent(BuildContext context) {
  return wrapInScaffold(
    ToBuyItemCard(
      item: ToBuyItem(
        id: '5',
        name: 'Medicine',
        category: 'Health',
        quantity: 1,
        isPurchased: false,
        addedDate: DateTime.now().subtract(const Duration(days: 5)),
      ),
      onTogglePurchased: () {},
      onRemove: () {},
      onQuantityChanged: () {},
    ),
    title: 'To Buy Item Card',
  );
}

@UseCase(
  name: 'No Category - Simple Item',
  type: ToBuyItemCard,
)
Widget toBuyItemCardNoCategory(BuildContext context) {
  return wrapInScaffold(
    ToBuyItemCard(
      item: ToBuyItem(
        id: '6',
        name: 'Batteries',
        category: null,
        quantity: 4,
        isPurchased: false,
        addedDate: DateTime.now().subtract(const Duration(hours: 6)),
      ),
      onTogglePurchased: () {},
      onRemove: () {},
      onQuantityChanged: () {},
    ),
    title: 'To Buy Item Card',
  );
}
