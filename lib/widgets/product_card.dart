import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../utils/placeholder_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.isFavorite = false,
    this.rating = 0.0,
    this.onFavoriteToggle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final double price;
  final bool isFavorite;
  final double rating;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                const PlaceholderImage(
                  width: double.infinity,
                  height: 150,
                  text: 'Product Image',
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: onFavoriteToggle,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const Spacer(),
                      if (rating > 0) ...[
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toStringAsFixed(1),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
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
  type: ProductCard,
)
Widget productCardDefault(BuildContext context) {
  return SizedBox(
    width: 200,
    child: ProductCard(
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Wireless Headphones',
      ),
      subtitle: context.knobs.string(
        label: 'Subtitle',
        initialValue: 'Premium Audio Quality',
      ),
      price: context.knobs.double.slider(
        label: 'Price',
        initialValue: 99.99,
        min: 0,
        max: 500,
      ),
      isFavorite: context.knobs.boolean(
        label: 'Is Favorite',
        initialValue: false,
      ),
      rating: context.knobs.double.slider(
        label: 'Rating',
        initialValue: 4.5,
        min: 0,
        max: 5,
      ),
    ),
  );
}

@UseCase(
  name: 'Favorite',
  type: ProductCard,
)
Widget productCardFavorite(BuildContext context) {
  return SizedBox(
    width: 200,
    child: ProductCard(
      title: 'Smart Watch',
      subtitle: 'Fitness Tracker',
      price: 199.99,
      isFavorite: true,
      rating: 4.8,
    ),
  );
}

@UseCase(
  name: 'No Rating',
  type: ProductCard,
)
Widget productCardNoRating(BuildContext context) {
  return SizedBox(
    width: 200,
    child: ProductCard(
      title: 'Bluetooth Speaker',
      subtitle: 'Portable Audio',
      price: 49.99,
      isFavorite: false,
      rating: 0.0,
    ),
  );
}