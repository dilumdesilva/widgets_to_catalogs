import 'package:flutter/material.dart';

enum BuyMoreButtonStyle {
  filled,
  outlined,
  text,
}

class BuyMoreButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final BuyMoreButtonStyle style;
  final bool showIcon;
  final String? label;

  const BuyMoreButton({
    super.key,
    this.onPressed,
    this.style = BuyMoreButtonStyle.outlined,
    this.showIcon = true,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final buttonLabel = label ?? 'Buy More';

    switch (style) {
      case BuyMoreButtonStyle.filled:
        return _buildFilledButton(context, buttonLabel);
      case BuyMoreButtonStyle.outlined:
        return _buildOutlinedButton(context, buttonLabel);
      case BuyMoreButtonStyle.text:
        return _buildTextButton(context, buttonLabel);
    }
  }

  Widget _buildFilledButton(BuildContext context, String buttonLabel) {
    if (showIcon) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add_shopping_cart, size: 18),
        label: Text(buttonLabel),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Text(buttonLabel),
      );
    }
  }

  Widget _buildOutlinedButton(BuildContext context, String buttonLabel) {
    if (showIcon) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add_shopping_cart, size: 18),
        label: Text(buttonLabel),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Text(buttonLabel),
      );
    }
  }

  Widget _buildTextButton(BuildContext context, String buttonLabel) {
    if (showIcon) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add_shopping_cart, size: 18),
        label: Text(buttonLabel),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Text(buttonLabel),
      );
    }
  }
}
