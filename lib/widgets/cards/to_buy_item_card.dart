import 'package:flutter/material.dart';
import '../../models/fridge_item.dart';

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
