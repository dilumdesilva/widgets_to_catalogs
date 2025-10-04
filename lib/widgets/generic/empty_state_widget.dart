import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final String emoji;
  final String? actionButtonText;
  final VoidCallback? onActionPressed;
  final EmptyStateType type;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.message,
    this.emoji = '📭',
    this.actionButtonText,
    this.onActionPressed,
    this.type = EmptyStateType.fridge,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionButtonText != null && onActionPressed != null) ...[
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onActionPressed,
                icon: Icon(_getActionIcon()),
                label: Text(actionButtonText!),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getActionIcon() {
    switch (type) {
      case EmptyStateType.fridge:
        return Icons.add;
      case EmptyStateType.shopping:
        return Icons.shopping_cart_outlined;
      case EmptyStateType.search:
        return Icons.search;
      case EmptyStateType.error:
        return Icons.refresh;
    }
  }
}

enum EmptyStateType {
  fridge,
  shopping,
  search,
  error,
}