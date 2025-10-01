import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../models/fridge_item.dart';

class ToBuyItemCard extends StatelessWidget {
  final ToBuyItem item;
  final VoidCallback? onTogglePurchased;
  final VoidCallback? onRemove;
  final VoidCallback? onQuantityChanged;

  const ToBuyItemCard({
    super.key,
    required this.item,
    this.onTogglePurchased,
    this.onRemove,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: item.isPurchased ? 1 : 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: item.isPurchased
              ? theme.colorScheme.surfaceContainerHighest.withOpacity(0.5)
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Checkbox(
                value: item.isPurchased,
                onChanged: (_) => onTogglePurchased?.call(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: item.isPurchased
                            ? TextDecoration.lineThrough
                            : null,
                        color: item.isPurchased
                            ? theme.colorScheme.outline
                            : null,
                      ),
                    ),
                    if (item.category != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        item.category!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                    const SizedBox(height: 4),
                    Text(
                      _formatAddedDate(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: onQuantityChanged,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
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
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: theme.colorScheme.error,
                ),
                onPressed: onRemove,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatAddedDate() {
    final now = DateTime.now();
    final difference = now.difference(item.addedDate);

    if (difference.inDays > 0) {
      return 'Added ${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return 'Added ${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return 'Added ${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just added';
    }
  }
}

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

  return ToBuyItemCard(
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
  );
}

@UseCase(
  name: 'Recently Added - Fresh Addition',
  type: ToBuyItemCard,
)
Widget toBuyItemCardRecentlyAdded(BuildContext context) {
  return ToBuyItemCard(
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
  );
}

@UseCase(
  name: 'Bulk Purchase - High Quantity',
  type: ToBuyItemCard,
)
Widget toBuyItemCardHighQuantity(BuildContext context) {
  return ToBuyItemCard(
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
  );
}

@UseCase(
  name: 'Purchased Item - Completed',
  type: ToBuyItemCard,
)
Widget toBuyItemCardPurchased(BuildContext context) {
  return ToBuyItemCard(
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
  );
}

@UseCase(
  name: 'Urgent Item - Old Addition',
  type: ToBuyItemCard,
)
Widget toBuyItemCardUrgent(BuildContext context) {
  return ToBuyItemCard(
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
  );
}

@UseCase(
  name: 'No Category - Simple Item',
  type: ToBuyItemCard,
)
Widget toBuyItemCardNoCategory(BuildContext context) {
  return ToBuyItemCard(
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
  );
}