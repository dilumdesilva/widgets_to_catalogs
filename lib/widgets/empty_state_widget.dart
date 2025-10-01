import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

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

@UseCase(
  name: 'Interactive - Customize Empty State',
  type: EmptyStateWidget,
)
Widget emptyStateInteractive(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: "What's in your fridge?",
  );

  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'Your fridge is empty! Add some items to get started.',
  );

  final emoji = context.knobs.list(
    label: 'Emoji',
    options: ['📭', '🧊', '🥛', '🍎', '🛒', '🔍', '😕', '✨'],
    initialOption: '📭',
  );

  final showButton = context.knobs.boolean(
    label: 'Show Action Button',
    initialValue: true,
  );

  final buttonText = context.knobs.string(
    label: 'Button Text',
    initialValue: 'Add First Item',
  );

  final type = context.knobs.list(
    label: 'Type',
    options: EmptyStateType.values,
    initialOption: EmptyStateType.fridge,
    labelBuilder: (type) => type.toString().split('.').last,
  );

  return EmptyStateWidget(
    title: title,
    message: message,
    emoji: emoji,
    type: type,
    actionButtonText: showButton ? buttonText : null,
    onActionPressed: showButton ? () {} : null,
  );
}

@UseCase(
  name: 'Empty Fridge - First Use',
  type: EmptyStateWidget,
)
Widget emptyStateFridge(BuildContext context) {
  return const EmptyStateWidget(
    title: "What's in your fridge?",
    message: 'Your fridge is empty! Add some items to get started.',
    emoji: '🧊',
    type: EmptyStateType.fridge,
    actionButtonText: 'Add First Item',
  );
}

@UseCase(
  name: 'Empty Shopping List - Nothing to Buy',
  type: EmptyStateWidget,
)
Widget emptyStateShopping(BuildContext context) {
  return const EmptyStateWidget(
    title: 'Shopping List Empty',
    message: 'No items to buy yet. Add items from your fridge when you run low!',
    emoji: '🛒',
    type: EmptyStateType.shopping,
    actionButtonText: 'Browse Fridge',
  );
}

@UseCase(
  name: 'No Search Results - Help Finding',
  type: EmptyStateWidget,
)
Widget emptyStateSearch(BuildContext context) {
  return const EmptyStateWidget(
    title: 'No Results Found',
    message: 'Try searching with different keywords or check your spelling.',
    emoji: '🔍',
    type: EmptyStateType.search,
    actionButtonText: 'Clear Search',
  );
}

@UseCase(
  name: 'Error State - Something Wrong',
  type: EmptyStateWidget,
)
Widget emptyStateError(BuildContext context) {
  return const EmptyStateWidget(
    title: 'Something went wrong',
    message: 'We couldn\'t load your items. Please try again.',
    emoji: '😕',
    type: EmptyStateType.error,
    actionButtonText: 'Try Again',
  );
}

@UseCase(
  name: 'Success State - No Action Needed',
  type: EmptyStateWidget,
)
Widget emptyStateNoButton(BuildContext context) {
  return const EmptyStateWidget(
    title: 'All Caught Up!',
    message: 'You\'ve completed everything. Great job!',
    emoji: '✨',
    type: EmptyStateType.fridge,
  );
}