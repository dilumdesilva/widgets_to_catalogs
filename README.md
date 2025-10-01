# MyFridge - Widgetbook Catalog Demo

A comprehensive Flutter application demonstrating the usage of the [Widgetbook](https://pub.dev/packages/widgetbook) package through a real-world **fridge inventory management app**. This project showcases **6 reusable widgets** and **complete app screens** with comprehensive interactive testing capabilities.

This project was developed by **Dilum De Silva** as part of the **"Widgets to Catalog"** tech talk.

## 🎤 Presentations

- **DevFest Melbourne 2025**

## Overview

**MyFridge** serves as a reference implementation for integrating Widgetbook into Flutter projects. It demonstrates best practices for widget isolation, UI testing, screen-level testing, and consistent rendering across mobile and web platforms through a practical fridge inventory management application.

## App Features

🧊 **MyFridge Inventory Management:**
- 📱 **Two-tab interface** - "My Fridge" and "To Buy" tabs
- ⭐ **Favorite system** - Star items to sort them to the top
- 🛒 **Smart shopping list** - "Buy More" button adds items to shopping list
- 📊 **Quantity management** - Track how many of each item you have
- 📅 **Expiry tracking** - Visual indicators for expired and expiring items
- ➕ **Add new items** - Comprehensive form with categories, emojis, and expiry dates
- 🏷️ **Item categories** - Dairy, Vegetables, Fruits, Meat, Beverages, Condiments, Snacks, Leftovers

🎨 **Widgetbook Testing Environment:**
- 🧩 **6 Reusable Widgets** with comprehensive interactive knobs
- 📱 **Complete App Screens** testable in isolation
- 🎛️ **Interactive knobs** for real-time widget customization
- 🌓 **Light & Dark Themes** with seamless switching
- 📱 **Cross-Platform Support** - runs on iOS, Android, and Web
- 🔄 **State testing** - Loading, empty, full data states
- 📖 **Comprehensive catalog** with organized component library

## Widget Library

This project includes the following reusable widgets:

### Core Fridge App Widgets:
1. **FridgeItemCard** - Displays fridge items with image, name, brand, quantity, favorite star, expiry status, and "Buy More" button
2. **ToBuyItemCard** - Shopping list item with checkbox, name, category, quantity, and time stamp
3. **QuantitySelector** - Interactive quantity picker with three styles (filled, outlined, minimal)
4. **AddItemDialog** - Complete form for adding new items with category selection, emoji picker, quantity, and expiry date
5. **EmptyStateWidget** - Customizable empty state with emoji, title, message, and optional action button

### Navigation & Structure:
6. **PrimaryTabBar** - Tab bar component for switching between app sections

### Screen Components:
7. **FridgeAppScreenWidget** - Complete app screen testable in Widgetbook with different data states

## Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart 3.8.1 or higher
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)

## Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd widgets_to_catalog
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate Widgetbook catalog:**
   ```bash
   flutter pub run build_runner build
   ```

## Running the Project

### Widgetbook Catalog (Recommended for Development)

Run the interactive Widgetbook catalog to explore and test all widgets:

```bash
flutter run -t lib/widgetbook/main_widgetbook.dart -d chrome
```

**Alternative platforms:**
```bash
# iOS Simulator
flutter run -t lib/widgetbook/main_widgetbook.dart -d ios

# Android Emulator
flutter run -t lib/widgetbook/main_widgetbook.dart -d android
```

### MyFridge Application

Run the main fridge inventory management app:

```bash
flutter run -t lib/main.dart
```

Features available in the app:
- Browse your fridge items on the "My Fridge" tab
- Star items to mark them as favorites
- Add items to your shopping list with the "Buy More" button
- Manage your shopping list on the "To Buy" tab
- Add new items with the floating action button

## Adding New Widgets to Widgetbook

Follow these steps to add a new widget to the Widgetbook catalog:

1. **Create your widget** in the `lib/widgets/` directory:
   ```dart
   // lib/widgets/my_new_widget.dart
   import 'package:flutter/material.dart';
   import 'package:widgetbook_annotation/widgetbook_annotation.dart';

   class MyNewWidget extends StatelessWidget {
     // Your widget implementation
   }
   ```

2. **Add UseCase annotations** for different variations:
   ```dart
   @UseCase(
     name: 'Default',
     type: MyNewWidget,
   )
   Widget myNewWidgetDefault(BuildContext context) {
     return MyNewWidget(
       title: context.knobs.text(
         label: 'Title',
         initialValue: 'Default Title',
       ),
       enabled: context.knobs.boolean(
         label: 'Enabled',
         initialValue: true,
       ),
     );
   }
   ```

3. **Import the widget** in `lib/widgetbook/main_widgetbook.dart`:
   ```dart
   import '../widgets/my_new_widget.dart';
   ```

4. **Regenerate the catalog:**
   ```bash
   flutter pub run build_runner build
   ```

5. **Hot reload or restart** to see your new widget in Widgetbook.

## Knobs Usage Examples

Widgetbook provides several types of knobs for interactive widget customization:

### Text Knobs
```dart
context.knobs.text(
  label: 'Button Label',
  initialValue: 'Click Me',
)
```

### Boolean Knobs
```dart
context.knobs.boolean(
  label: 'Is Enabled',
  initialValue: true,
)
```

### Number Knobs
```dart
context.knobs.double.slider(
  label: 'Quantity',
  initialValue: 5.0,
  max: 20.0,
  min: 0.0,
).toInt()
```

### List Knobs
```dart
context.knobs.list(
  label: 'Category',
  options: FoodCategory.values,
  initialOption: FoodCategory.dairy,
  labelBuilder: (category) => category.displayName,
)
```

## Project Structure

```
widgets_to_catalog/
├── lib/
│   ├── main.dart                           # MyFridge app entry point
│   ├── widgetbook/
│   │   ├── main_widgetbook.dart            # Widgetbook catalog entry point
│   │   └── main_widgetbook.directories.g.dart  # Generated widgetbook structure
│   ├── models/
│   │   └── fridge_item.dart                # Data models for FridgeItem and ToBuyItem
│   ├── data/
│   │   └── sample_fridge_data.dart         # Sample data for testing
│   ├── screens/
│   │   └── fridge_app_screen.dart          # Main app screen with tabs
│   ├── widgets/                            # Reusable widget library
│   │   ├── fridge_item_card.dart           # Fridge item display card
│   │   ├── to_buy_item_card.dart           # Shopping list item card
│   │   ├── quantity_selector.dart          # Interactive quantity picker
│   │   ├── add_item_dialog.dart            # Dialog for adding new items
│   │   ├── empty_state_widget.dart         # Empty state display
│   │   ├── primary_tab_bar.dart            # Tab navigation component
│   │   └── fridge_app_screen_widget.dart   # Full app screen for Widgetbook testing
│   └── themes/
│       └── app_themes.dart                 # Light/Dark theme definitions
├── pubspec.yaml                           # Dependencies and project configuration
└── README.md                              # This file
```

## Best Practices

- **Lightweight Widgets**: Keep widgets focused and reusable
- **Data Models**: Use strongly-typed models with proper state management
- **Hot Reload**: Take advantage of Flutter's hot reload during development
- **Knobs**: Use descriptive labels and sensible default values for knobs
- **UseCase Naming**: Use clear, descriptive names for different widget states
- **Theme Support**: Ensure widgets work well with both light and dark themes
- **State Management**: Use StatefulWidget for components that need local state
- **Sample Data**: Provide realistic sample data for comprehensive testing

## Widgetbook Features Demonstrated

- **Theme Switching**: Toggle between light and dark themes
- **Device Frames**: Preview widgets on different device form factors (iPhone, Android, Desktop)
- **Text Scaling**: Test accessibility with different text scale factors
- **Alignment**: Test widget layouts with different alignments
- **Inspector**: Debug widget properties and layout information
- **Interactive Knobs**: Real-time widget customization with sliders, toggles, and dropdowns
- **Screen Testing**: Full app screen testing with different states and data scenarios

## Development Workflow

1. **Create Widget**: Develop your widget in isolation with proper data models
2. **Add UseCases**: Define different states and variations with comprehensive knobs
3. **Test in Widgetbook**: Use interactive knobs to test all possible configurations
4. **Screen Testing**: Create full-screen use cases for complete app testing
5. **Integrate**: Add the widget to your main MyFridge application
6. **Regenerate**: Run build_runner when adding new widgets or use cases

## Troubleshooting

### Build Runner Issues
If you encounter issues with code generation:
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build
```

### Missing Generated Files
Ensure all widget files with `@UseCase` annotations are imported in `main_widgetbook.dart`.

### Platform-Specific Issues
- **Web**: Some widgets may require web-specific implementations
- **Mobile**: Test on real devices for accurate touch interactions

## Contributing

When contributing new widgets to MyFridge:

1. Follow the existing code style and patterns
2. Add comprehensive UseCase examples with interactive knobs
3. Ensure widgets work with the fridge/shopping list data models
4. Test widgets across all supported platforms (iOS, Android, Web)
5. Update this README if adding significant features
6. Test thoroughly in both the MyFridge app and Widgetbook catalog

## Resources

- [Widgetbook Documentation](https://docs.widgetbook.io/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design Guidelines](https://material.io/design)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)

