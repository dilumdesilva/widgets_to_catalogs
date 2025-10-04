import 'package:flutter/material.dart';

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
