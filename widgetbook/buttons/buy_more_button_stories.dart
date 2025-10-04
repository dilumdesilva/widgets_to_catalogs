import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/widgets/buttons/buy_more_button.dart';
import '../common/scaffold_wrapper.dart';

@UseCase(
  name: 'Interactive - Customize Button',
  type: BuyMoreButton,
)
Widget buyMoreButtonInteractive(BuildContext context) {
  final style = context.knobs.list(
    label: 'Style',
    options: BuyMoreButtonStyle.values,
    initialOption: BuyMoreButtonStyle.outlined,
    labelBuilder: (style) => style.toString().split('.').last,
  );

  final showIcon = context.knobs.boolean(
    label: 'Show Icon',
    initialValue: true,
  );

  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Buy More',
  );

  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  return wrapInScaffold(
    BuyMoreButton(
      style: style,
      showIcon: showIcon,
      label: label,
      onPressed: enabled ? () {} : null,
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Filled - With Icon',
  type: BuyMoreButton,
)
Widget buyMoreButtonFilledWithIcon(BuildContext context) {
  return wrapInScaffold(
    BuyMoreButton(
      style: BuyMoreButtonStyle.filled,
      showIcon: true,
      onPressed: () {},
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Filled - Without Icon',
  type: BuyMoreButton,
)
Widget buyMoreButtonFilledWithoutIcon(BuildContext context) {
  return wrapInScaffold(
    BuyMoreButton(
      style: BuyMoreButtonStyle.filled,
      showIcon: false,
      onPressed: () {},
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Outlined - With Icon',
  type: BuyMoreButton,
)
Widget buyMoreButtonOutlinedWithIcon(BuildContext context) {
  return wrapInScaffold(
    BuyMoreButton(
      style: BuyMoreButtonStyle.outlined,
      showIcon: true,
      onPressed: () {},
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Outlined - Without Icon',
  type: BuyMoreButton,
)
Widget buyMoreButtonOutlinedWithoutIcon(BuildContext context) {
  return wrapInScaffold(
    BuyMoreButton(
      style: BuyMoreButtonStyle.outlined,
      showIcon: false,
      onPressed: () {},
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Text - With Icon',
  type: BuyMoreButton,
)
Widget buyMoreButtonTextWithIcon(BuildContext context) {
  return wrapInScaffold(
    BuyMoreButton(
      style: BuyMoreButtonStyle.text,
      showIcon: true,
      onPressed: () {},
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Text - Without Icon',
  type: BuyMoreButton,
)
Widget buyMoreButtonTextWithoutIcon(BuildContext context) {
  return wrapInScaffold(
    BuyMoreButton(
      style: BuyMoreButtonStyle.text,
      showIcon: false,
      onPressed: () {},
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Disabled - All Styles',
  type: BuyMoreButton,
)
Widget buyMoreButtonDisabled(BuildContext context) {
  return wrapInScaffold(
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BuyMoreButton(
          style: BuyMoreButtonStyle.filled,
          showIcon: true,
          label: 'Filled (Disabled)',
          onPressed: null,
        ),
        const SizedBox(height: 16),
        BuyMoreButton(
          style: BuyMoreButtonStyle.outlined,
          showIcon: true,
          label: 'Outlined (Disabled)',
          onPressed: null,
        ),
        const SizedBox(height: 16),
        BuyMoreButton(
          style: BuyMoreButtonStyle.text,
          showIcon: true,
          label: 'Text (Disabled)',
          onPressed: null,
        ),
      ],
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'Custom Label',
  type: BuyMoreButton,
)
Widget buyMoreButtonCustomLabel(BuildContext context) {
  return wrapInScaffold(
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BuyMoreButton(
          style: BuyMoreButtonStyle.filled,
          showIcon: true,
          label: 'Add to Cart',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        BuyMoreButton(
          style: BuyMoreButtonStyle.outlined,
          showIcon: true,
          label: 'Reorder',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        BuyMoreButton(
          style: BuyMoreButtonStyle.text,
          showIcon: true,
          label: 'Shop Again',
          onPressed: () {},
        ),
      ],
    ),
    title: 'Buy More Button',
  );
}

@UseCase(
  name: 'All Variants Comparison',
  type: BuyMoreButton,
)
Widget buyMoreButtonAllVariants(BuildContext context) {
  return wrapInScaffold(
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Filled:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuyMoreButton(
              style: BuyMoreButtonStyle.filled,
              showIcon: true,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            BuyMoreButton(
              style: BuyMoreButtonStyle.filled,
              showIcon: false,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text('Outlined:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuyMoreButton(
              style: BuyMoreButtonStyle.outlined,
              showIcon: true,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            BuyMoreButton(
              style: BuyMoreButtonStyle.outlined,
              showIcon: false,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text('Text:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuyMoreButton(
              style: BuyMoreButtonStyle.text,
              showIcon: true,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            BuyMoreButton(
              style: BuyMoreButtonStyle.text,
              showIcon: false,
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
    title: 'Buy More Button',
  );
}
