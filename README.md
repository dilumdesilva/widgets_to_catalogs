# Widgets to Catalog App

A comprehensive Flutter application demonstrating the usage of the [Widgetbook](https://pub.dev/packages/widgetbook) package. This project showcases **10 reusable widgets** with multiple variations, all accessible and testable through Widgetbook's interactive catalog interface.

This project was developed by **Dilum De Silva** as part of the **"Widgets to Catalog"** tech talk.

## 🎤 Presentations

- **DevFest Melbourne 2025**

## Overview

The **Widgets to Catalog App** serves as a reference implementation for integrating Widgetbook into Flutter projects. It demonstrates best practices for widget isolation, UI testing, and consistent rendering across mobile and web platforms.

## Features

- 🧩 **10 Reusable Widgets** with multiple variations and interactive states
- 📱 **Cross-Platform Support** - runs on iOS, Android, and Web
- 🎨 **Light & Dark Themes** with seamless switching
- 🔧 **Interactive Knobs** for real-time widget customization
- 📖 **Comprehensive Widgetbook Catalog** with organized component library
- 🚀 **Live Demo App** showcasing all widgets in action

## Widget Library

This project includes the following reusable widgets:

1. **ProductCard** - Card showing title, subtitle, price, image placeholder, favorite state, and rating
2. **CustomSearchBar** - Input bar with placeholder text, prefix icon, and clear button
3. **PrimaryTabBar** - Tab bar with 2–4 tabs, icons, and active index state
4. **StarOnCard** - Card with an overlay star toggle and optional badge count
5. **ActionButton** - Button with label, icon, disabled state, and size variations
6. **ProfileAvatar** - Circular avatar with image or initials, optional status badge, and size variations
7. **InfoListTile** - List tile with leading icon, title, subtitle, and trailing action
8. **RatingRow** - Star rating row (0–5) with optional numeric label and interactive mode
9. **Badge** - Small badge with text or number, color variations, and overflow behavior
10. **MiniFormField** - Text input field with hint text, error state, and prefix/suffix icons

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

### Demo Application

Run the sample app showcasing all widgets in a complete interface:

```bash
flutter run -t lib/main.dart
```

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
context.knobs.number(
  label: 'Price',
  initialValue: 99.99,
).toDouble()
```

### Option Knobs
```dart
context.knobs.options(
  label: 'Size',
  options: [
    const Option(label: 'Small', value: ButtonSize.small),
    const Option(label: 'Medium', value: ButtonSize.medium),
    const Option(label: 'Large', value: ButtonSize.large),
  ],
  initialOption: const Option(label: 'Medium', value: ButtonSize.medium),
)
```

## Project Structure

```
widgets_to_catalog/
├── lib/
│   ├── main.dart                      # Demo app entry point
│   ├── widgetbook/
│   │   └── main_widgetbook.dart        # Widgetbook catalog entry point
│   ├── widgets/                       # Reusable widget library
│   │   ├── product_card.dart
│   │   ├── search_bar.dart
│   │   ├── primary_tab_bar.dart
│   │   ├── star_on_card.dart
│   │   ├── action_button.dart
│   │   ├── profile_avatar.dart
│   │   ├── info_list_tile.dart
│   │   ├── rating_row.dart
│   │   ├── badge.dart
│   │   └── mini_form_field.dart
│   ├── themes/
│   │   └── app_themes.dart             # Light/Dark theme definitions
│   └── utils/
│       └── placeholder_image.dart      # Placeholder image utilities
├── pubspec.yaml                       # Dependencies and project configuration
└── README.md                          # This file
```

## Best Practices

- **Lightweight Widgets**: Keep widgets focused and reusable
- **Placeholder Images**: Use the provided `PlaceholderImage` utility for consistent placeholder content
- **Hot Reload**: Take advantage of Flutter's hot reload during development
- **Knobs**: Use descriptive labels and sensible default values for knobs
- **UseCase Naming**: Use clear, descriptive names for different widget states
- **Theme Support**: Ensure widgets work well with both light and dark themes

## Widgetbook Features Demonstrated

- **Theme Switching**: Toggle between light and dark themes
- **Device Frames**: Preview widgets on different device form factors
- **Text Scaling**: Test accessibility with different text scale factors
- **Alignment**: Test widget layouts with different alignments
- **Inspector**: Debug widget properties and layout information

## Development Workflow

1. **Create Widget**: Develop your widget in isolation
2. **Add UseCases**: Define different states and variations
3. **Test in Widgetbook**: Use knobs to test all possible configurations
4. **Integrate**: Add the widget to your main application
5. **Regenerate**: Run build_runner when adding new widgets

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

When contributing new widgets:

1. Follow the existing code style and patterns
2. Add comprehensive UseCase examples
3. Ensure widgets work across all supported platforms
4. Update this README if adding significant features
5. Test thoroughly in both the demo app and Widgetbook

## Resources

- [Widgetbook Documentation](https://docs.widgetbook.io/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design Guidelines](https://material.io/design)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)

