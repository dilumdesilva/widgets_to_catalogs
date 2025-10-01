import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../models/fridge_item.dart';
import '../widgets/fridge_item_card.dart';
import '../widgets/to_buy_item_card.dart';
import '../widgets/primary_tab_bar.dart';
import '../widgets/add_item_dialog.dart';
import '../widgets/empty_state_widget.dart';

class FridgeAppScreenWidget extends StatefulWidget {
  final List<FridgeItem> fridgeItems;
  final List<ToBuyItem> toBuyItems;
  final int initialTabIndex;
  final bool isLoading;

  const FridgeAppScreenWidget({
    super.key,
    required this.fridgeItems,
    required this.toBuyItems,
    this.initialTabIndex = 0,
    this.isLoading = false,
  });

  @override
  State<FridgeAppScreenWidget> createState() => _FridgeAppScreenWidgetState();
}

class _FridgeAppScreenWidgetState extends State<FridgeAppScreenWidget> {
  late int _currentTabIndex;
  late List<FridgeItem> _fridgeItems;
  late List<ToBuyItem> _toBuyItems;

  @override
  void initState() {
    super.initState();
    _currentTabIndex = widget.initialTabIndex;
    _fridgeItems = List.from(widget.fridgeItems);
    _toBuyItems = List.from(widget.toBuyItems);
  }

  @override
  void didUpdateWidget(FridgeAppScreenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTabIndex != widget.initialTabIndex) {
      _currentTabIndex = widget.initialTabIndex;
    }
    if (oldWidget.fridgeItems != widget.fridgeItems) {
      _fridgeItems = List.from(widget.fridgeItems);
    }
    if (oldWidget.toBuyItems != widget.toBuyItems) {
      _toBuyItems = List.from(widget.toBuyItems);
    }
  }

  List<FridgeItem> get _sortedFridgeItems {
    final sorted = List<FridgeItem>.from(_fridgeItems);
    sorted.sort((a, b) {
      if (a.isFavorite && !b.isFavorite) return -1;
      if (!a.isFavorite && b.isFavorite) return 1;
      return a.name.compareTo(b.name);
    });
    return sorted;
  }

  void _toggleFavorite(String itemId) {
    setState(() {
      final index = _fridgeItems.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        _fridgeItems[index] = _fridgeItems[index].copyWith(
          isFavorite: !_fridgeItems[index].isFavorite,
        );
      }
    });
  }

  void _addToBuyList(FridgeItem fridgeItem) {
    final existingIndex = _toBuyItems.indexWhere(
      (item) => item.name.toLowerCase() == fridgeItem.name.toLowerCase(),
    );

    setState(() {
      if (existingIndex != -1) {
        _toBuyItems[existingIndex] = _toBuyItems[existingIndex].copyWith(
          quantity: _toBuyItems[existingIndex].quantity + 1,
        );
      } else {
        _toBuyItems.add(
          ToBuyItem(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            name: fridgeItem.name,
            category: fridgeItem.categoryDisplayName,
            quantity: 1,
            addedDate: DateTime.now(),
          ),
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${fridgeItem.name} added to shopping list'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleToBuyPurchased(String itemId) {
    setState(() {
      final index = _toBuyItems.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        _toBuyItems[index] = _toBuyItems[index].copyWith(
          isPurchased: !_toBuyItems[index].isPurchased,
        );
      }
    });
  }

  void _removeToBuyItem(String itemId) {
    setState(() {
      _toBuyItems.removeWhere((item) => item.id == itemId);
    });
  }

  void _addNewItem(FridgeItem newItem) {
    setState(() {
      _fridgeItems.add(newItem);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newItem.name} added to your fridge'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(
        onAddItem: _addNewItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTabIndex == 0 ? "MyFridge" : 'Shopping List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: widget.isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading your fridge...'),
                ],
              ),
            )
          : Column(
              children: [
                PrimaryTabBar(
                  tabs: const [
                    TabData(label: 'My Fridge', icon: Icons.kitchen),
                    TabData(label: 'To Buy', icon: Icons.shopping_cart),
                  ],
                  initialIndex: _currentTabIndex,
                  onTabChanged: (index) {
                    setState(() {
                      _currentTabIndex = index;
                    });
                  },
                ),
                Expanded(
                  child: _currentTabIndex == 0 ? _buildFridgeTab() : _buildToBuyTab(),
                ),
              ],
            ),
      floatingActionButton: !widget.isLoading && _currentTabIndex == 0
          ? FloatingActionButton.extended(
              onPressed: _showAddItemDialog,
              icon: const Icon(Icons.add),
              label: const Text('Add Item'),
            )
          : null,
    );
  }

  Widget _buildFridgeTab() {
    final sortedItems = _sortedFridgeItems;

    if (sortedItems.isEmpty) {
      return const EmptyStateWidget(
        title: "What's in your fridge?",
        message: 'Your fridge is empty! Add some items to get started.',
        emoji: '🧊',
        type: EmptyStateType.fridge,
        actionButtonText: 'Add First Item',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                "What's in my fridge",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${sortedItems.length} items',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: sortedItems.length,
            itemBuilder: (context, index) {
              final item = sortedItems[index];
              return FridgeItemCard(
                item: item,
                onFavoriteToggle: () => _toggleFavorite(item.id),
                onBuyMore: () => _addToBuyList(item),
                onQuantityChanged: () => {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildToBuyTab() {
    final pendingItems = _toBuyItems.where((item) => !item.isPurchased).toList();
    final purchasedItems = _toBuyItems.where((item) => item.isPurchased).toList();

    if (_toBuyItems.isEmpty) {
      return const EmptyStateWidget(
        title: 'Shopping List Empty',
        message: 'No items to buy yet. Add items from your fridge when you run low!',
        emoji: '🛒',
        type: EmptyStateType.shopping,
        actionButtonText: 'Browse Fridge',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Shopping List',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              if (pendingItems.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${pendingItems.length} to buy',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              ...pendingItems.map((item) => ToBuyItemCard(
                item: item,
                onTogglePurchased: () => _toggleToBuyPurchased(item.id),
                onRemove: () => _removeToBuyItem(item.id),
                onQuantityChanged: () => {},
              )),
              if (purchasedItems.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Purchased',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                ...purchasedItems.map((item) => ToBuyItemCard(
                  item: item,
                  onTogglePurchased: () => _toggleToBuyPurchased(item.id),
                  onRemove: () => _removeToBuyItem(item.id),
                  onQuantityChanged: () => {},
                )),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// Sample data generators
List<FridgeItem> _generateSampleFridgeItems(int count) {
  final items = <FridgeItem>[];
  final sampleData = [
    ('Milk', '🥛', FoodCategory.dairy, 'Organic Valley'),
    ('Eggs', '🥚', FoodCategory.dairy, null),
    ('Apples', '🍎', FoodCategory.fruits, null),
    ('Carrots', '🥕', FoodCategory.vegetables, null),
    ('Chicken Breast', '🍗', FoodCategory.meat, null),
    ('Orange Juice', '🍊', FoodCategory.beverages, null),
    ('Cheese', '🧀', FoodCategory.dairy, 'Tillamook'),
    ('Bananas', '🍌', FoodCategory.fruits, null),
    ('Yogurt', '🥛', FoodCategory.dairy, 'Greek Gods'),
    ('Leftover Pizza', '🍕', FoodCategory.leftovers, null),
  ];

  for (int i = 0; i < count && i < sampleData.length; i++) {
    final data = sampleData[i];
    items.add(FridgeItem(
      id: '${i + 1}',
      name: data.$1,
      imagePath: data.$2,
      category: data.$3,
      quantity: (i % 5) + 1,
      isFavorite: i % 3 == 0,
      expiryDate: DateTime.now().add(Duration(days: (i % 10) + 1)),
      brand: data.$4,
    ));
  }

  return items;
}

List<ToBuyItem> _generateSampleToBuyItems(int count) {
  final items = <ToBuyItem>[];
  final sampleData = [
    ('Bread', 'Bakery'),
    ('Tomatoes', 'Vegetables'),
    ('Shampoo', null),
    ('Paper Towels', 'Household'),
    ('Avocados', 'Fruits'),
  ];

  for (int i = 0; i < count && i < sampleData.length; i++) {
    final data = sampleData[i];
    items.add(ToBuyItem(
      id: 'buy${i + 1}',
      name: data.$1,
      category: data.$2,
      quantity: (i % 3) + 1,
      isPurchased: i > count * 0.7,
      addedDate: DateTime.now().subtract(Duration(hours: i * 2)),
    ));
  }

  return items;
}

@UseCase(
  name: 'Interactive - Complete App Testing',
  type: FridgeAppScreenWidget,
)
Widget fridgeAppScreenInteractive(BuildContext context) {
  final currentTab = context.knobs.list(
    label: 'Current Tab',
    options: [0, 1],
    initialOption: 0,
    labelBuilder: (index) => index == 0 ? 'My Fridge' : 'To Buy',
  );

  final fridgeItemCount = context.knobs.double.slider(
    label: 'Fridge Items Count',
    initialValue: 10.0,
    max: 10.0,
    min: 0.0,
  ).toInt();

  final toBuyItemCount = context.knobs.double.slider(
    label: 'To Buy Items Count',
    initialValue: 3.0,
    max: 5.0,
    min: 0.0,
  ).toInt();

  final isLoading = context.knobs.boolean(
    label: 'Loading State',
    initialValue: false,
  );

  return FridgeAppScreenWidget(
    initialTabIndex: currentTab,
    fridgeItems: _generateSampleFridgeItems(fridgeItemCount),
    toBuyItems: _generateSampleToBuyItems(toBuyItemCount),
    isLoading: isLoading,
  );
}

@UseCase(
  name: 'First Launch - New User Experience',
  type: FridgeAppScreenWidget,
)
Widget fridgeAppScreenEmpty(BuildContext context) {
  return const FridgeAppScreenWidget(
    initialTabIndex: 0,
    fridgeItems: [],
    toBuyItems: [],
  );
}

@UseCase(
  name: 'Well Stocked - Empty Shopping List',
  type: FridgeAppScreenWidget,
)
Widget fridgeAppScreenEmptyShoppingList(BuildContext context) {
  return FridgeAppScreenWidget(
    initialTabIndex: 1,
    fridgeItems: _generateSampleFridgeItems(5),
    toBuyItems: const [],
  );
}

@UseCase(
  name: 'Loading State - Data Fetching',
  type: FridgeAppScreenWidget,
)
Widget fridgeAppScreenLoading(BuildContext context) {
  return const FridgeAppScreenWidget(
    fridgeItems: [],
    toBuyItems: [],
    isLoading: true,
  );
}

@UseCase(
  name: 'Active Household - Full Data',
  type: FridgeAppScreenWidget,
)
Widget fridgeAppScreenFull(BuildContext context) {
  return FridgeAppScreenWidget(
    fridgeItems: _generateSampleFridgeItems(10),
    toBuyItems: _generateSampleToBuyItems(5),
  );
}

@UseCase(
  name: 'Shopping Mode - To Buy Tab',
  type: FridgeAppScreenWidget,
)
Widget fridgeAppScreenShoppingTab(BuildContext context) {
  return FridgeAppScreenWidget(
    initialTabIndex: 1,
    fridgeItems: _generateSampleFridgeItems(8),
    toBuyItems: _generateSampleToBuyItems(4),
  );
}