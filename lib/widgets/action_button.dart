import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

enum ButtonSize { small, medium, large }

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.variant = ActionButtonVariant.primary,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ButtonSize size;
  final bool isLoading;
  final ActionButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    EdgeInsets padding;
    double fontSize;
    double iconSize;

    switch (size) {
      case ButtonSize.small:
        padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
        fontSize = 12;
        iconSize = 16;
        break;
      case ButtonSize.medium:
        padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
        fontSize = 14;
        iconSize = 18;
        break;
      case ButtonSize.large:
        padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
        fontSize = 16;
        iconSize = 20;
        break;
    }

    Widget buttonChild = isLoading
        ? SizedBox(
            width: iconSize,
            height: iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                variant == ActionButtonVariant.primary
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.primary,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: iconSize),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
              ),
            ],
          );

    switch (variant) {
      case ActionButtonVariant.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: buttonChild,
        );
      case ActionButtonVariant.secondary:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: buttonChild,
        );
      case ActionButtonVariant.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: buttonChild,
        );
    }
  }
}

enum ActionButtonVariant { primary, secondary, text }

@UseCase(
  name: 'Default',
  type: ActionButton,
)
Widget actionButtonDefault(BuildContext context) {
  return ActionButton(
    label: context.knobs.string(
      label: 'Label',
      initialValue: 'Click Me',
    ),
    icon: context.knobs.list<IconData?>(
      label: 'Icon',
      options: [null, Icons.add, Icons.download, Icons.share],
      labelBuilder: (option) {
        if (option == null) return 'None';
        if (option == Icons.add) return 'Add';
        if (option == Icons.download) return 'Download';
        if (option == Icons.share) return 'Share';
        return 'Unknown';
      },
    ),
    size: context.knobs.list<ButtonSize>(
      label: 'Size',
      options: [ButtonSize.small, ButtonSize.medium, ButtonSize.large],
      labelBuilder: (size) => size.name.toUpperCase(),
    ),
    variant: context.knobs.list<ActionButtonVariant>(
      label: 'Variant',
      options: [ActionButtonVariant.primary, ActionButtonVariant.secondary, ActionButtonVariant.text],
      labelBuilder: (variant) => variant.name.toUpperCase(),
    ),
    isLoading: context.knobs.boolean(
      label: 'Is Loading',
      initialValue: false,
    ),
  );
}

@UseCase(
  name: 'With Icon',
  type: ActionButton,
)
Widget actionButtonWithIcon(BuildContext context) {
  return const ActionButton(
    label: 'Download',
    icon: Icons.download,
    size: ButtonSize.medium,
    variant: ActionButtonVariant.primary,
  );
}

@UseCase(
  name: 'Loading State',
  type: ActionButton,
)
Widget actionButtonLoading(BuildContext context) {
  return const ActionButton(
    label: 'Processing...',
    isLoading: true,
    size: ButtonSize.medium,
    variant: ActionButtonVariant.primary,
  );
}