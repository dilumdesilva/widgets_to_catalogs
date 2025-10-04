import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/widgets/generic/empty_state_widget.dart';
import '../common/scaffold_wrapper.dart';

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

  return wrapInScaffold(
    EmptyStateWidget(
      title: title,
      message: message,
      emoji: emoji,
      type: type,
      actionButtonText: showButton ? buttonText : null,
      onActionPressed: showButton ? () {} : null,
    ),
    title: 'Empty State Widget',
  );
}

@UseCase(
  name: 'Empty Fridge - First Use',
  type: EmptyStateWidget,
)
Widget emptyStateFridge(BuildContext context) {
  return wrapInScaffold(
    const EmptyStateWidget(
      title: "What's in your fridge?",
      message: 'Your fridge is empty! Add some items to get started.',
      emoji: '🧊',
      type: EmptyStateType.fridge,
      actionButtonText: 'Add First Item',
    ),
    title: 'Empty State Widget',
  );
}

@UseCase(
  name: 'Empty Shopping List - Nothing to Buy',
  type: EmptyStateWidget,
)
Widget emptyStateShopping(BuildContext context) {
  return wrapInScaffold(
    const EmptyStateWidget(
      title: 'Shopping List Empty',
      message: 'No items to buy yet. Add items from your fridge when you run low!',
      emoji: '🛒',
      type: EmptyStateType.shopping,
      actionButtonText: 'Browse Fridge',
    ),
    title: 'Empty State Widget',
  );
}

@UseCase(
  name: 'No Search Results - Help Finding',
  type: EmptyStateWidget,
)
Widget emptyStateSearch(BuildContext context) {
  return wrapInScaffold(
    const EmptyStateWidget(
      title: 'No Results Found',
      message: 'Try searching with different keywords or check your spelling.',
      emoji: '🔍',
      type: EmptyStateType.search,
      actionButtonText: 'Clear Search',
    ),
    title: 'Empty State Widget',
  );
}

@UseCase(
  name: 'Error State - Something Wrong',
  type: EmptyStateWidget,
)
Widget emptyStateError(BuildContext context) {
  return wrapInScaffold(
    const EmptyStateWidget(
      title: 'Something went wrong',
      message: 'We couldn\'t load your items. Please try again.',
      emoji: '😕',
      type: EmptyStateType.error,
      actionButtonText: 'Try Again',
    ),
    title: 'Empty State Widget',
  );
}

@UseCase(
  name: 'Success State - No Action Needed',
  type: EmptyStateWidget,
)
Widget emptyStateNoButton(BuildContext context) {
  return wrapInScaffold(
    const EmptyStateWidget(
      title: 'All Caught Up!',
      message: 'You\'ve completed everything. Great job!',
      emoji: '✨',
      type: EmptyStateType.fridge,
    ),
    title: 'Empty State Widget',
  );
}
