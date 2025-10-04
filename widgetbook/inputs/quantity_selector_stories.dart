import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/widgets/inputs/quantity_selector.dart';
import '../common/scaffold_wrapper.dart';

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

  return wrapInScaffold(
    QuantitySelector(
      quantity: quantity,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      style: style,
      showLabel: showLabel,
      label: showLabel ? label : null,
      onQuantityChanged: (value) {},
    ),
    title: 'Quantity Selector',
  );
}

@UseCase(
  name: 'Empty State - Zero Quantity',
  type: QuantitySelector,
)
Widget quantitySelectorAtMinimum(BuildContext context) {
  return wrapInScaffold(
    QuantitySelector(
      quantity: 0,
      minQuantity: 0,
      maxQuantity: 10,
      label: 'Empty',
      style: QuantitySelectorStyle.outlined,
      onQuantityChanged: (value) {},
    ),
    title: 'Quantity Selector',
  );
}

@UseCase(
  name: 'Full Stock - Maximum Quantity',
  type: QuantitySelector,
)
Widget quantitySelectorAtMaximum(BuildContext context) {
  return wrapInScaffold(
    QuantitySelector(
      quantity: 99,
      minQuantity: 1,
      maxQuantity: 99,
      label: 'Max Items',
      style: QuantitySelectorStyle.filled,
      onQuantityChanged: (value) {},
    ),
    title: 'Quantity Selector',
  );
}

@UseCase(
  name: 'Style Comparison - Visual Options',
  type: QuantitySelector,
)
Widget quantitySelectorAllStyles(BuildContext context) {
  return wrapInScaffold(
    Column(
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
    ),
    title: 'Quantity Selector',
  );
}
