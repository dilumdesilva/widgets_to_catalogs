import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({
    super.key,
    this.width = 100,
    this.height = 100,
    this.text,
    this.backgroundColor,
    this.textColor,
  });

  final double width;
  final double height;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBackgroundColor = backgroundColor ??
        theme.colorScheme.surfaceContainerHighest;
    final defaultTextColor = textColor ??
        theme.colorScheme.onSurfaceVariant;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: defaultBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: Center(
        child: text != null
            ? Text(
                text!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: defaultTextColor,
                ),
                textAlign: TextAlign.center,
              )
            : Icon(
                Icons.image_outlined,
                size: width * 0.3,
                color: defaultTextColor,
              ),
      ),
    );
  }
}

class CircularPlaceholderImage extends StatelessWidget {
  const CircularPlaceholderImage({
    super.key,
    this.radius = 25,
    this.text,
    this.backgroundColor,
    this.textColor,
  });

  final double radius;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBackgroundColor = backgroundColor ??
        theme.colorScheme.surfaceContainerHighest;
    final defaultTextColor = textColor ??
        theme.colorScheme.onSurfaceVariant;

    return CircleAvatar(
      radius: radius,
      backgroundColor: defaultBackgroundColor,
      child: text != null
          ? Text(
              text!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: defaultTextColor,
                fontWeight: FontWeight.w500,
              ),
            )
          : Icon(
              Icons.person_outline,
              size: radius * 0.8,
              color: defaultTextColor,
            ),
    );
  }
}