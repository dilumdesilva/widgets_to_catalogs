import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class RatingRow extends StatefulWidget {
  const RatingRow({
    super.key,
    this.rating = 0,
    this.maxRating = 5,
    this.onRatingChanged,
    this.isInteractive = false,
    this.showLabel = false,
    this.starSize = 24,
    this.spacing = 4,
  });

  final int rating;
  final int maxRating;
  final ValueChanged<int>? onRatingChanged;
  final bool isInteractive;
  final bool showLabel;
  final double starSize;
  final double spacing;

  @override
  State<RatingRow> createState() => _RatingRowState();
}

class _RatingRowState extends State<RatingRow> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  void didUpdateWidget(RatingRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rating != oldWidget.rating) {
      _currentRating = widget.rating;
    }
  }

  void _handleRatingTap(int rating) {
    if (widget.isInteractive) {
      setState(() {
        _currentRating = rating;
      });
      widget.onRatingChanged?.call(rating);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(widget.maxRating, (index) {
          final starRating = index + 1;
          final isFilled = starRating <= _currentRating;

          return GestureDetector(
            onTap: widget.isInteractive ? () => _handleRatingTap(starRating) : null,
            child: Padding(
              padding: EdgeInsets.only(
                right: index < widget.maxRating - 1 ? widget.spacing : 0,
              ),
              child: Icon(
                isFilled ? Icons.star : Icons.star_border,
                size: widget.starSize,
                color: isFilled
                    ? Colors.amber
                    : theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
              ),
            ),
          );
        }),
        if (widget.showLabel) ...[
          SizedBox(width: widget.spacing * 2),
          Text(
            '$_currentRating/${widget.maxRating}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

@UseCase(
  name: 'Default',
  type: RatingRow,
)
Widget ratingRowDefault(BuildContext context) {
  return RatingRow(
    rating: context.knobs.int.slider(
      label: 'Rating',
      initialValue: 3,
      min: 0,
      max: 5,
    ),
    maxRating: context.knobs.int.slider(
      label: 'Max Rating',
      initialValue: 5,
      min: 3,
      max: 10,
    ),
    isInteractive: context.knobs.boolean(
      label: 'Is Interactive',
      initialValue: false,
    ),
    showLabel: context.knobs.boolean(
      label: 'Show Label',
      initialValue: false,
    ),
    starSize: context.knobs.double.slider(
      label: 'Star Size',
      initialValue: 24,
      min: 16,
      max: 48,
    ),
  );
}

@UseCase(
  name: 'Interactive',
  type: RatingRow,
)
Widget ratingRowInteractive(BuildContext context) {
  return const RatingRow(
    rating: 0,
    maxRating: 5,
    isInteractive: true,
    showLabel: true,
    starSize: 32,
  );
}

@UseCase(
  name: 'With Label',
  type: RatingRow,
)
Widget ratingRowWithLabel(BuildContext context) {
  return const RatingRow(
    rating: 4,
    maxRating: 5,
    showLabel: true,
    starSize: 20,
  );
}