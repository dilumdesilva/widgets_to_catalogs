import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../models/fridge_item.dart';

class FridgeItemCard extends StatelessWidget {
  final FridgeItem item;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onBuyMore;
  final VoidCallback? onQuantityChanged;

  const FridgeItemCard({
    super.key,
    required this.item,
    this.onFavoriteToggle,
    this.onBuyMore,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      item.imagePath,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              item.isFavorite ? Icons.star : Icons.star_border,
                              color: item.isFavorite ? Colors.amber : null,
                            ),
                            onPressed: onFavoriteToggle,
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      if (item.brand != null) ...[
                        Text(
                          item.brand!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.outline,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Text(
                        item.categoryDisplayName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getQuantityColor(context),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: onQuantityChanged,
                        child: Icon(
                          Icons.inventory_2_outlined,
                          size: 16,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${item.quantity}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (item.isExpired)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Expired',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onError,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                else if (item.isExpiringSoon)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Expires Soon',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: onBuyMore,
                  icon: const Icon(Icons.add_shopping_cart, size: 16),
                  label: const Text('Buy More'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: Size.zero,
                    textStyle: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getQuantityColor(BuildContext context) {
    final theme = Theme.of(context);
    if (item.quantity == 0) {
      return theme.colorScheme.errorContainer;
    } else if (item.quantity <= 2) {
      return Colors.orange.withOpacity(0.2);
    } else {
      return theme.colorScheme.surfaceContainerHighest;
    }
  }
}

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

  return FridgeItemCard(
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
  );
}

@UseCase(
  name: 'Expired Item - Requires Attention',
  type: FridgeItemCard,
)
Widget fridgeItemCardExpired(BuildContext context) {
  return FridgeItemCard(
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
  );
}

@UseCase(
  name: 'Empty Item - Needs Restocking',
  type: FridgeItemCard,
)
Widget fridgeItemCardZeroQuantity(BuildContext context) {
  return FridgeItemCard(
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
  );
}

@UseCase(
  name: 'Favorite Item - Priority Display',
  type: FridgeItemCard,
)
Widget fridgeItemCardFavorite(BuildContext context) {
  return FridgeItemCard(
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
  );
}

@UseCase(
  name: 'Expiring Soon - Use First Warning',
  type: FridgeItemCard,
)
Widget fridgeItemCardExpiringSoon(BuildContext context) {
  return FridgeItemCard(
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
  );
}

@UseCase(
  name: 'Fresh Item - Perfect Condition',
  type: FridgeItemCard,
)
Widget fridgeItemCardFresh(BuildContext context) {
  return FridgeItemCard(
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
  );
}

@UseCase(
  name: 'High Quantity - Well Stocked',
  type: FridgeItemCard,
)
Widget fridgeItemCardHighQuantity(BuildContext context) {
  return FridgeItemCard(
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
  );
}