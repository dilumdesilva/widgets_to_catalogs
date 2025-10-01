import 'package:flutter/material.dart';
import '../models/fridge_item.dart';
import '../data/sample_fridge_data.dart';
import '../widgets/fridge_item_card.dart';
import '../widgets/to_buy_item_card.dart';
import '../widgets/primary_tab_bar.dart';
import '../widgets/add_item_dialog.dart';

class FridgeAppScreen extends StatefulWidget {
  const FridgeAppScreen({super.key});

  @override
  State<FridgeAppScreen> createState() => _FridgeAppScreenState();
}

class _FridgeAppScreenState extends State<FridgeAppScreen> {
  int _currentTabIndex = 0;
  List<FridgeItem> _fridgeItems = [];
  List<ToBuyItem> _toBuyItems = [];

  @override
  void initState() {
    super.initState();
    _fridgeItems = List.from(SampleFridgeData.fridgeItems);
    _toBuyItems = List.from(SampleFridgeData.toBuyItems);
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

  void _updateQuantity(String itemId, int newQuantity) {
    setState(() {
      final index = _fridgeItems.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        _fridgeItems[index] = _fridgeItems[index].copyWith(quantity: newQuantity);
      }
    });
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

  void _updateToBuyQuantity(String itemId, int newQuantity) {
    setState(() {
      final index = _toBuyItems.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        _toBuyItems[index] = _toBuyItems[index].copyWith(quantity: newQuantity);
      }
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
      body: Column(
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
      floatingActionButton: _currentTabIndex == 0
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
                onQuantityChanged: () => _showQuantityDialog(item),
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
                onQuantityChanged: () => _showToBuyQuantityDialog(item),
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
                  onQuantityChanged: () => _showToBuyQuantityDialog(item),
                )),
              ],
            ],
          ),
        ),
      ],
    );
  }

  void _showQuantityDialog(FridgeItem item) {
    int tempQuantity = item.quantity;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('Update ${item.name} quantity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Current quantity: ${item.quantity}'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: tempQuantity > 0
                        ? () => setState(() => tempQuantity--)
                        : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.outline),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$tempQuantity',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => tempQuantity++),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateQuantity(item.id, tempQuantity);
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  void _showToBuyQuantityDialog(ToBuyItem item) {
    int tempQuantity = item.quantity;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('Update ${item.name} quantity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Current quantity: ${item.quantity}'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: tempQuantity > 1
                        ? () => setState(() => tempQuantity--)
                        : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.outline),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$tempQuantity',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => tempQuantity++),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateToBuyQuantity(item.id, tempQuantity);
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}