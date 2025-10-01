import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../models/fridge_item.dart';

class AddItemDialog extends StatefulWidget {
  final Function(FridgeItem) onAddItem;

  const AddItemDialog({
    super.key,
    required this.onAddItem,
  });

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();

  FoodCategory _selectedCategory = FoodCategory.dairy;
  int _quantity = 1;
  String _selectedEmoji = '🥛';
  DateTime? _expiryDate;

  final Map<FoodCategory, List<String>> _categoryEmojis = {
    FoodCategory.dairy: ['🥛', '🧀', '🥚', '🧈', '🥯'],
    FoodCategory.vegetables: ['🥕', '🥬', '🥒', '🍅', '🥔', '🌽', '🥦'],
    FoodCategory.fruits: ['🍎', '🍌', '🍊', '🍇', '🍓', '🥝', '🍑'],
    FoodCategory.meat: ['🍗', '🥩', '🍖', '🐟', '🦐', '🥓'],
    FoodCategory.beverages: ['🧃', '☕', '🥤', '🍹', '🍷', '🧊'],
    FoodCategory.condiments: ['🧂', '🍯', '🫒', '🥫', '🧄', '🌶️'],
    FoodCategory.snacks: ['🍿', '🥨', '🍪', '🍫', '🥜', '🍰'],
    FoodCategory.leftovers: ['🍕', '🍝', '🍲', '🥘', '🍛', '🍜'],
  };

  @override
  void initState() {
    super.initState();
    _updateEmojiForCategory();
  }

  void _updateEmojiForCategory() {
    final emojis = _categoryEmojis[_selectedCategory] ?? ['🥛'];
    _selectedEmoji = emojis.first;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Add New Item',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Flexible(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Item Name',
                          hintText: 'e.g., Milk, Eggs, Apples',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter an item name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _brandController,
                        decoration: const InputDecoration(
                          labelText: 'Brand (Optional)',
                          hintText: 'e.g., Organic Valley',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Category',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<FoodCategory>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: FoodCategory.values.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(_getCategoryDisplayName(category)),
                          );
                        }).toList(),
                        onChanged: (FoodCategory? value) {
                          if (value != null) {
                            setState(() {
                              _selectedCategory = value;
                              _updateEmojiForCategory();
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Choose Icon',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.colorScheme.outline),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (_categoryEmojis[_selectedCategory] ?? []).map((emoji) {
                            final isSelected = emoji == _selectedEmoji;
                            return GestureDetector(
                              onTap: () => setState(() => _selectedEmoji = emoji),
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? theme.colorScheme.primaryContainer
                                      : theme.colorScheme.surfaceContainerHighest,
                                  borderRadius: BorderRadius.circular(8),
                                  border: isSelected
                                      ? Border.all(color: theme.colorScheme.primary, width: 2)
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    emoji,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quantity',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: theme.colorScheme.outline),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: _quantity > 1
                                            ? () => setState(() => _quantity--)
                                            : null,
                                        icon: const Icon(Icons.remove),
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(minWidth: 48),
                                        child: Text(
                                          '$_quantity',
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => setState(() => _quantity++),
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expiry Date (Optional)',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                OutlinedButton.icon(
                                  onPressed: () => _selectExpiryDate(),
                                  icon: const Icon(Icons.calendar_today),
                                  label: Text(
                                    _expiryDate != null
                                        ? '${_expiryDate!.day}/${_expiryDate!.month}/${_expiryDate!.year}'
                                        : 'Select Date',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryDisplayName(FoodCategory category) {
    switch (category) {
      case FoodCategory.dairy:
        return 'Dairy';
      case FoodCategory.vegetables:
        return 'Vegetables';
      case FoodCategory.fruits:
        return 'Fruits';
      case FoodCategory.meat:
        return 'Meat';
      case FoodCategory.beverages:
        return 'Beverages';
      case FoodCategory.condiments:
        return 'Condiments';
      case FoodCategory.snacks:
        return 'Snacks';
      case FoodCategory.leftovers:
        return 'Leftovers';
    }
  }

  Future<void> _selectExpiryDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _expiryDate = picked;
      });
    }
  }

  void _addItem() {
    if (_formKey.currentState!.validate()) {
      final newItem = FridgeItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        imagePath: _selectedEmoji,
        category: _selectedCategory,
        quantity: _quantity,
        brand: _brandController.text.trim().isNotEmpty ? _brandController.text.trim() : null,
        expiryDate: _expiryDate,
      );

      widget.onAddItem(newItem);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    super.dispose();
  }
}

@UseCase(
  name: 'Interactive - Form Testing',
  type: AddItemDialog,
)
Widget addItemDialogInteractive(BuildContext context) {

  return AddItemDialog(
    onAddItem: (item) {
      // This is just for widgetbook preview
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Would add: ${item.name}')),
      );
    },
  );
}

@UseCase(
  name: 'Quick Add - Essential Fields Only',
  type: AddItemDialog,
)
Widget addItemDialogMinimal(BuildContext context) {
  return AddItemDialog(
    onAddItem: (item) {
      // This is just for widgetbook preview
    },
  );
}