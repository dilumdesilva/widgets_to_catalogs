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

import 'buttons/buy_more_button_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories;
import 'cards/fridge_item_card_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories;
import 'cards/to_buy_item_card_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_cards_to_buy_item_card_stories;
import 'generic/add_item_dialog_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_generic_add_item_dialog_stories;
import 'generic/empty_state_widget_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_generic_empty_state_widget_stories;
import 'generic/primary_tab_bar_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_generic_primary_tab_bar_stories;
import 'inputs/quantity_selector_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_inputs_quantity_selector_stories;
import 'screens/fridge_app_screen_stories.dart'
    as _asset_widgets_to_catalog_widgetbook_screens_fridge_app_screen_stories;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'buttons',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'BuyMoreButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'All Variants Comparison',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonAllVariants,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Custom Label',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonCustomLabel,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Disabled - All Styles',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonDisabled,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Filled - With Icon',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonFilledWithIcon,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Filled - Without Icon',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonFilledWithoutIcon,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Interactive - Customize Button',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonInteractive,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Outlined - With Icon',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonOutlinedWithIcon,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Outlined - Without Icon',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonOutlinedWithoutIcon,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Text - With Icon',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonTextWithIcon,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Text - Without Icon',
                builder:
                    _asset_widgets_to_catalog_widgetbook_buttons_buy_more_button_stories
                        .buyMoreButtonTextWithoutIcon,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'cards',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'FridgeItemCard',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Empty Item - Needs Restocking',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories
                        .fridgeItemCardZeroQuantity,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Expired Item - Requires Attention',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories
                        .fridgeItemCardExpired,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Expiring Soon - Use First Warning',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories
                        .fridgeItemCardExpiringSoon,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Favorite Item - Priority Display',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories
                        .fridgeItemCardFavorite,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Fresh Item - Perfect Condition',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories
                        .fridgeItemCardFresh,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'High Quantity - Well Stocked',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories
                        .fridgeItemCardHighQuantity,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Interactive - Customize Item',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_fridge_item_card_stories
                        .fridgeItemCardInteractive,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'ToBuyItemCard',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Bulk Purchase - High Quantity',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_to_buy_item_card_stories
                        .toBuyItemCardHighQuantity,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Interactive - Customize Shopping Item',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_to_buy_item_card_stories
                        .toBuyItemCardInteractive,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'No Category - Simple Item',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_to_buy_item_card_stories
                        .toBuyItemCardNoCategory,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Purchased Item - Completed',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_to_buy_item_card_stories
                        .toBuyItemCardPurchased,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Recently Added - Fresh Addition',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_to_buy_item_card_stories
                        .toBuyItemCardRecentlyAdded,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Urgent Item - Old Addition',
                builder:
                    _asset_widgets_to_catalog_widgetbook_cards_to_buy_item_card_stories
                        .toBuyItemCardUrgent,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'generic',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'AddItemDialog',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Interactive - Form Testing',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_add_item_dialog_stories
                        .addItemDialogInteractive,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Quick Add - Essential Fields Only',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_add_item_dialog_stories
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
                    _asset_widgets_to_catalog_widgetbook_generic_empty_state_widget_stories
                        .emptyStateFridge,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Empty Shopping List - Nothing to Buy',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_empty_state_widget_stories
                        .emptyStateShopping,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Error State - Something Wrong',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_empty_state_widget_stories
                        .emptyStateError,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Interactive - Customize Empty State',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_empty_state_widget_stories
                        .emptyStateInteractive,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'No Search Results - Help Finding',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_empty_state_widget_stories
                        .emptyStateSearch,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Success State - No Action Needed',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_empty_state_widget_stories
                        .emptyStateNoButton,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'PrimaryTabBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Four Tabs',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_primary_tab_bar_stories
                        .primaryTabBarFourTabs,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Text Only',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_primary_tab_bar_stories
                        .primaryTabBarTextOnly,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Two Tabs',
                builder:
                    _asset_widgets_to_catalog_widgetbook_generic_primary_tab_bar_stories
                        .primaryTabBarTwoTabs,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'inputs',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'QuantitySelector',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Empty State - Zero Quantity',
                builder:
                    _asset_widgets_to_catalog_widgetbook_inputs_quantity_selector_stories
                        .quantitySelectorAtMinimum,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Full Stock - Maximum Quantity',
                builder:
                    _asset_widgets_to_catalog_widgetbook_inputs_quantity_selector_stories
                        .quantitySelectorAtMaximum,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Interactive - Style Testing',
                builder:
                    _asset_widgets_to_catalog_widgetbook_inputs_quantity_selector_stories
                        .quantitySelectorInteractive,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Style Comparison - Visual Options',
                builder:
                    _asset_widgets_to_catalog_widgetbook_inputs_quantity_selector_stories
                        .quantitySelectorAllStyles,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'screens',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'FridgeAppScreen',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Active Household - Full Data',
                builder:
                    _asset_widgets_to_catalog_widgetbook_screens_fridge_app_screen_stories
                        .fridgeAppScreenFull,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'First Launch - New User Experience',
                builder:
                    _asset_widgets_to_catalog_widgetbook_screens_fridge_app_screen_stories
                        .fridgeAppScreenEmpty,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Interactive - Complete App Testing',
                builder:
                    _asset_widgets_to_catalog_widgetbook_screens_fridge_app_screen_stories
                        .fridgeAppScreenInteractive,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Loading State - Data Fetching',
                builder:
                    _asset_widgets_to_catalog_widgetbook_screens_fridge_app_screen_stories
                        .fridgeAppScreenLoading,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Shopping Mode - To Buy Tab',
                builder:
                    _asset_widgets_to_catalog_widgetbook_screens_fridge_app_screen_stories
                        .fridgeAppScreenShoppingTab,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Well Stocked - Empty Shopping List',
                builder:
                    _asset_widgets_to_catalog_widgetbook_screens_fridge_app_screen_stories
                        .fridgeAppScreenEmptyShoppingList,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
