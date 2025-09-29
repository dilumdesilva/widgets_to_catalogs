import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.size = BadgeSize.medium,
    this.shape = BadgeShape.rounded,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final BadgeSize size;
  final BadgeShape shape;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    EdgeInsets padding;
    double fontSize;
    double borderRadius;

    switch (size) {
      case BadgeSize.small:
        padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 2);
        fontSize = 10;
        borderRadius = 8;
        break;
      case BadgeSize.medium:
        padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
        fontSize = 12;
        borderRadius = 12;
        break;
      case BadgeSize.large:
        padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
        fontSize = 14;
        borderRadius = 16;
        break;
    }

    final defaultColor = color ?? theme.colorScheme.primary;
    final defaultTextColor = textColor ?? theme.colorScheme.onPrimary;

    BorderRadius getBorderRadius() {
      switch (shape) {
        case BadgeShape.rounded:
          return BorderRadius.circular(borderRadius);
        case BadgeShape.circular:
          return BorderRadius.circular(100);
        case BadgeShape.square:
          return BorderRadius.zero;
      }
    }

    // Handle text overflow for very long text
    String displayText = text;
    if (text.length > 10) {
      displayText = '${text.substring(0, 8)}...';
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: defaultColor,
        borderRadius: getBorderRadius(),
      ),
      child: Text(
        displayText,
        style: theme.textTheme.labelSmall?.copyWith(
          color: defaultTextColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

enum BadgeSize { small, medium, large }
enum BadgeShape { rounded, circular, square }

@UseCase(
  name: 'Default',
  type: Badge,
)
Widget badgeDefault(BuildContext context) {
  return Badge(
    text: context.knobs.string(
      label: 'Text',
      initialValue: 'New',
    ),
    size: context.knobs.list<BadgeSize>(
      label: 'Size',
      options: [BadgeSize.small, BadgeSize.medium, BadgeSize.large],
      labelBuilder: (size) => size.name.toUpperCase(),
    ),
    shape: context.knobs.list<BadgeShape>(
      label: 'Shape',
      options: [BadgeShape.rounded, BadgeShape.circular, BadgeShape.square],
      labelBuilder: (shape) => shape.name.toUpperCase(),
    ),
  );
}

@UseCase(
  name: 'Number Badge',
  type: Badge,
)
Widget badgeNumber(BuildContext context) {
  return const Badge(
    text: '42',
    size: BadgeSize.small,
    shape: BadgeShape.circular,
    color: Colors.red,
  );
}

@UseCase(
  name: 'Status Badge',
  type: Badge,
)
Widget badgeStatus(BuildContext context) {
  return const Badge(
    text: 'Premium',
    size: BadgeSize.medium,
    shape: BadgeShape.rounded,
    color: Colors.green,
  );
}

@UseCase(
  name: 'Overflow Text',
  type: Badge,
)
Widget badgeOverflow(BuildContext context) {
  return const Badge(
    text: 'Very Long Badge Text That Should Overflow',
    size: BadgeSize.medium,
    shape: BadgeShape.rounded,
  );
}