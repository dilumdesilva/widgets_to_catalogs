import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final int minQuantity;
  final int maxQuantity;
  final ValueChanged<int>? onQuantityChanged;
  final String? label;
  final bool showLabel;
  final QuantitySelectorStyle style;

  const QuantitySelector({
    super.key,
    required this.quantity,
    this.minQuantity = 0,
    this.maxQuantity = 99,
    this.onQuantityChanged,
    this.label,
    this.showLabel = true,
    this.style = QuantitySelectorStyle.outlined,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (style) {
      case QuantitySelectorStyle.filled:
        return _buildFilledStyle(context, theme);
      case QuantitySelectorStyle.outlined:
        return _buildOutlinedStyle(context, theme);
      case QuantitySelectorStyle.minimal:
        return _buildMinimalStyle(context, theme);
    }
  }

  Widget _buildFilledStyle(BuildContext context, ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel && label != null) ...[
          Text(
            label!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          const SizedBox(height: 4),
        ],
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(
                context,
                icon: Icons.remove,
                onPressed: quantity > minQuantity
                    ? () => onQuantityChanged?.call(quantity - 1)
                    : null,
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 48),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  '$quantity',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildIconButton(
                context,
                icon: Icons.add,
                onPressed: quantity < maxQuantity
                    ? () => onQuantityChanged?.call(quantity + 1)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOutlinedStyle(BuildContext context, ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel && label != null) ...[
          Text(
            label!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          const SizedBox(height: 4),
        ],
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(
                context,
                icon: Icons.remove,
                onPressed: quantity > minQuantity
                    ? () => onQuantityChanged?.call(quantity - 1)
                    : null,
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 48),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  '$quantity',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildIconButton(
                context,
                icon: Icons.add,
                onPressed: quantity < maxQuantity
                    ? () => onQuantityChanged?.call(quantity + 1)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMinimalStyle(BuildContext context, ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel && label != null) ...[
          Text(
            label!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          const SizedBox(width: 8),
        ],
        _buildIconButton(
          context,
          icon: Icons.remove_circle_outline,
          onPressed: quantity > minQuantity
              ? () => onQuantityChanged?.call(quantity - 1)
              : null,
        ),
        Container(
          constraints: const BoxConstraints(minWidth: 32),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildIconButton(
          context,
          icon: Icons.add_circle_outline,
          onPressed: quantity < maxQuantity
              ? () => onQuantityChanged?.call(quantity + 1)
              : null,
        ),
      ],
    );
  }

  Widget _buildIconButton(
    BuildContext context, {
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      iconSize: 20,
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      padding: const EdgeInsets.all(4),
    );
  }
}

enum QuantitySelectorStyle {
  filled,
  outlined,
  minimal,
}

@UseCase(
  name: 'Interactive - Style Testing',
  type: QuantitySelector,
)
Widget quantitySelectorInteractive(BuildContext context) {
  final quantity = context.knobs.double.slider(
    label: 'Quantity',
    initialValue: 3.0,
    max: 20.0,
    min: 0.0,
  ).toInt();

  final minQuantity = context.knobs.double.slider(
    label: 'Min Quantity',
    initialValue: 0.0,
    max: 5.0,
    min: 0.0,
  ).toInt();

  final maxQuantity = context.knobs.double.slider(
    label: 'Max Quantity',
    initialValue: 10.0,
    max: 50.0,
    min: 5.0,
  ).toInt();

  final style = context.knobs.list(
    label: 'Style',
    options: QuantitySelectorStyle.values,
    initialOption: QuantitySelectorStyle.filled,
    labelBuilder: (style) => style.toString().split('.').last,
  );

  final showLabel = context.knobs.boolean(
    label: 'Show Label',
    initialValue: true,
  );

  final label = context.knobs.string(
    label: 'Label Text',
    initialValue: 'Quantity',
  );

  return QuantitySelector(
    quantity: quantity,
    minQuantity: minQuantity,
    maxQuantity: maxQuantity,
    style: style,
    showLabel: showLabel,
    label: showLabel ? label : null,
    onQuantityChanged: (value) {},
  );
}

@UseCase(
  name: 'Empty State - Zero Quantity',
  type: QuantitySelector,
)
Widget quantitySelectorAtMinimum(BuildContext context) {
  return QuantitySelector(
    quantity: 0,
    minQuantity: 0,
    maxQuantity: 10,
    label: 'Empty',
    style: QuantitySelectorStyle.outlined,
    onQuantityChanged: (value) {},
  );
}

@UseCase(
  name: 'Full Stock - Maximum Quantity',
  type: QuantitySelector,
)
Widget quantitySelectorAtMaximum(BuildContext context) {
  return QuantitySelector(
    quantity: 99,
    minQuantity: 1,
    maxQuantity: 99,
    label: 'Max Items',
    style: QuantitySelectorStyle.filled,
    onQuantityChanged: (value) {},
  );
}

@UseCase(
  name: 'Style Comparison - Visual Options',
  type: QuantitySelector,
)
Widget quantitySelectorAllStyles(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      QuantitySelector(
        quantity: 5,
        label: 'Filled',
        style: QuantitySelectorStyle.filled,
        onQuantityChanged: (value) {},
      ),
      const SizedBox(height: 16),
      QuantitySelector(
        quantity: 5,
        label: 'Outlined',
        style: QuantitySelectorStyle.outlined,
        onQuantityChanged: (value) {},
      ),
      const SizedBox(height: 16),
      QuantitySelector(
        quantity: 5,
        label: 'Minimal',
        style: QuantitySelectorStyle.minimal,
        onQuantityChanged: (value) {},
      ),
    ],
  );
}