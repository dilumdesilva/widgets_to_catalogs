// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgets_to_catalog/widgets/add_item_dialog.dart'
    as _widgets_to_catalog_widgets_add_item_dialog;
import 'package:widgets_to_catalog/widgets/empty_state_widget.dart'
    as _widgets_to_catalog_widgets_empty_state_widget;
import 'package:widgets_to_catalog/widgets/fridge_app_screen_widget.dart'
    as _widgets_to_catalog_widgets_fridge_app_screen_widget;
import 'package:widgets_to_catalog/widgets/fridge_item_card.dart'
    as _widgets_to_catalog_widgets_fridge_item_card;
import 'package:widgets_to_catalog/widgets/primary_tab_bar.dart'
    as _widgets_to_catalog_widgets_primary_tab_bar;
import 'package:widgets_to_catalog/widgets/quantity_selector.dart'
    as _widgets_to_catalog_widgets_quantity_selector;
import 'package:widgets_to_catalog/widgets/to_buy_item_card.dart'
    as _widgets_to_catalog_widgets_to_buy_item_card;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AddItemDialog',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive - Form Testing',
            builder: _widgets_to_catalog_widgets_add_item_dialog
                .addItemDialogInteractive,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Quick Add - Essential Fields Only',
            builder: _widgets_to_catalog_widgets_add_item_dialog
                .addItemDialogMinimal,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'EmptyStateWidget',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Empty Fridge - First Use',
            builder:
                _widgets_to_catalog_widgets_empty_state_widget.emptyStateFridge,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Empty Shopping List - Nothing to Buy',
            builder: _widgets_to_catalog_widgets_empty_state_widget
                .emptyStateShopping,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Error State - Something Wrong',
            builder:
                _widgets_to_catalog_widgets_empty_state_widget.emptyStateError,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive - Customize Empty State',
            builder: _widgets_to_catalog_widgets_empty_state_widget
                .emptyStateInteractive,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'No Search Results - Help Finding',
            builder:
                _widgets_to_catalog_widgets_empty_state_widget.emptyStateSearch,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Success State - No Action Needed',
            builder: _widgets_to_catalog_widgets_empty_state_widget
                .emptyStateNoButton,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'FridgeAppScreenWidget',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Active Household - Full Data',
            builder: _widgets_to_catalog_widgets_fridge_app_screen_widget
                .fridgeAppScreenFull,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'First Launch - New User Experience',
            builder: _widgets_to_catalog_widgets_fridge_app_screen_widget
                .fridgeAppScreenEmpty,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive - Complete App Testing',
            builder: _widgets_to_catalog_widgets_fridge_app_screen_widget
                .fridgeAppScreenInteractive,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Loading State - Data Fetching',
            builder: _widgets_to_catalog_widgets_fridge_app_screen_widget
                .fridgeAppScreenLoading,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Shopping Mode - To Buy Tab',
            builder: _widgets_to_catalog_widgets_fridge_app_screen_widget
                .fridgeAppScreenShoppingTab,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Well Stocked - Empty Shopping List',
            builder: _widgets_to_catalog_widgets_fridge_app_screen_widget
                .fridgeAppScreenEmptyShoppingList,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'FridgeItemCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Empty Item - Needs Restocking',
            builder: _widgets_to_catalog_widgets_fridge_item_card
                .fridgeItemCardZeroQuantity,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Expired Item - Requires Attention',
            builder: _widgets_to_catalog_widgets_fridge_item_card
                .fridgeItemCardExpired,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Expiring Soon - Use First Warning',
            builder: _widgets_to_catalog_widgets_fridge_item_card
                .fridgeItemCardExpiringSoon,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Favorite Item - Priority Display',
            builder: _widgets_to_catalog_widgets_fridge_item_card
                .fridgeItemCardFavorite,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Fresh Item - Perfect Condition',
            builder: _widgets_to_catalog_widgets_fridge_item_card
                .fridgeItemCardFresh,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'High Quantity - Well Stocked',
            builder: _widgets_to_catalog_widgets_fridge_item_card
                .fridgeItemCardHighQuantity,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive - Customize Item',
            builder: _widgets_to_catalog_widgets_fridge_item_card
                .fridgeItemCardInteractive,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'PrimaryTabBar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Four Tabs',
            builder: _widgets_to_catalog_widgets_primary_tab_bar
                .primaryTabBarFourTabs,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Text Only',
            builder: _widgets_to_catalog_widgets_primary_tab_bar
                .primaryTabBarTextOnly,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Two Tabs',
            builder: _widgets_to_catalog_widgets_primary_tab_bar
                .primaryTabBarTwoTabs,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'QuantitySelector',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Empty State - Zero Quantity',
            builder: _widgets_to_catalog_widgets_quantity_selector
                .quantitySelectorAtMinimum,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Full Stock - Maximum Quantity',
            builder: _widgets_to_catalog_widgets_quantity_selector
                .quantitySelectorAtMaximum,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive - Style Testing',
            builder: _widgets_to_catalog_widgets_quantity_selector
                .quantitySelectorInteractive,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Style Comparison - Visual Options',
            builder: _widgets_to_catalog_widgets_quantity_selector
                .quantitySelectorAllStyles,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'ToBuyItemCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Bulk Purchase - High Quantity',
            builder: _widgets_to_catalog_widgets_to_buy_item_card
                .toBuyItemCardHighQuantity,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive - Customize Shopping Item',
            builder: _widgets_to_catalog_widgets_to_buy_item_card
                .toBuyItemCardInteractive,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'No Category - Simple Item',
            builder: _widgets_to_catalog_widgets_to_buy_item_card
                .toBuyItemCardNoCategory,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Purchased Item - Completed',
            builder: _widgets_to_catalog_widgets_to_buy_item_card
                .toBuyItemCardPurchased,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Recently Added - Fresh Addition',
            builder: _widgets_to_catalog_widgets_to_buy_item_card
                .toBuyItemCardRecentlyAdded,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Urgent Item - Old Addition',
            builder: _widgets_to_catalog_widgets_to_buy_item_card
                .toBuyItemCardUrgent,
          ),
        ],
      ),
    ],
  ),
];
