import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'badge.dart' as custom_badge;
import '../utils/placeholder_image.dart';

class StarOnCard extends StatelessWidget {
  const StarOnCard({
    super.key,
    required this.child,
    this.isStarred = false,
    this.badgeCount,
    this.onStarToggle,
    this.onTap,
  });

  final Widget child;
  final bool isStarred;
  final int? badgeCount;
  final VoidCallback? onStarToggle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            child,
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                onPressed: onStarToggle,
                icon: Icon(
                  isStarred ? Icons.star : Icons.star_border,
                  color: isStarred ? Colors.amber : Colors.grey,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
            if (badgeCount != null && badgeCount! > 0)
              Positioned(
                top: 4,
                left: 8,
                child: custom_badge.Badge(
                  text: badgeCount.toString(),
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: StarOnCard,
)
Widget starOnCardDefault(BuildContext context) {
  return SizedBox(
    width: 200,
    height: 200,
    child: StarOnCard(
      isStarred: context.knobs.boolean(
        label: 'Is Starred',
        initialValue: false,
      ),
      badgeCount: context.knobs.int.slider(
        label: 'Badge Count',
        initialValue: 0,
        min: 0,
        max: 10,
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            PlaceholderImage(
              width: double.infinity,
              height: 120,
              text: 'Content',
            ),
            SizedBox(height: 12),
            Text(
              'Card with Star',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Starred with Badge',
  type: StarOnCard,
)
Widget starOnCardStarredWithBadge(BuildContext context) {
  return SizedBox(
    width: 200,
    height: 200,
    child: StarOnCard(
      isStarred: true,
      badgeCount: 3,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            PlaceholderImage(
              width: double.infinity,
              height: 120,
              text: 'Featured',
            ),
            SizedBox(height: 12),
            Text(
              'Featured Item',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );
}