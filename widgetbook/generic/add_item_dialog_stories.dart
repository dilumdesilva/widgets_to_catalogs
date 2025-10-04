import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/widgets/generic/add_item_dialog.dart';
import 'package:widgets_to_catalog/models/fridge_item.dart';
import '../common/scaffold_wrapper.dart';

@UseCase(
  name: 'Interactive - Form Testing',
  type: AddItemDialog,
)
Widget addItemDialogInteractive(BuildContext context) {

  return wrapInScaffold(
    AddItemDialog(
      onAddItem: (item) {
        // This is just for widgetbook preview
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Would add: ${item.name}')),
        );
      },
    ),
    title: 'Add Item Dialog',
  );
}

@UseCase(
  name: 'Quick Add - Essential Fields Only',
  type: AddItemDialog,
)
Widget addItemDialogMinimal(BuildContext context) {
  return wrapInScaffold(
    AddItemDialog(
      onAddItem: (item) {
        // This is just for widgetbook preview
      },
    ),
    title: 'Add Item Dialog',
  );
}
