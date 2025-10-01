enum FoodCategory {
  dairy,
  vegetables,
  fruits,
  meat,
  beverages,
  condiments,
  snacks,
  leftovers,
}

class FridgeItem {
  final String id;
  final String name;
  final String imagePath;
  final FoodCategory category;
  int quantity;
  bool isFavorite;
  DateTime? expiryDate;
  final String? brand;

  FridgeItem({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    this.quantity = 1,
    this.isFavorite = false,
    this.expiryDate,
    this.brand,
  });

  FridgeItem copyWith({
    String? id,
    String? name,
    String? imagePath,
    FoodCategory? category,
    int? quantity,
    bool? isFavorite,
    DateTime? expiryDate,
    String? brand,
  }) {
    return FridgeItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
      expiryDate: expiryDate ?? this.expiryDate,
      brand: brand ?? this.brand,
    );
  }

  bool get isExpiringSoon {
    if (expiryDate == null) return false;
    final now = DateTime.now();
    final daysUntilExpiry = expiryDate!.difference(now).inDays;
    return daysUntilExpiry <= 3 && daysUntilExpiry >= 0;
  }

  bool get isExpired {
    if (expiryDate == null) return false;
    return DateTime.now().isAfter(expiryDate!);
  }

  String get categoryDisplayName {
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
}

class ToBuyItem {
  final String id;
  final String name;
  final String? category;
  final int quantity;
  final bool isPurchased;
  final DateTime addedDate;

  ToBuyItem({
    required this.id,
    required this.name,
    this.category,
    this.quantity = 1,
    this.isPurchased = false,
    required this.addedDate,
  });

  ToBuyItem copyWith({
    String? id,
    String? name,
    String? category,
    int? quantity,
    bool? isPurchased,
    DateTime? addedDate,
  }) {
    return ToBuyItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      isPurchased: isPurchased ?? this.isPurchased,
      addedDate: addedDate ?? this.addedDate,
    );
  }
}