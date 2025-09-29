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
import 'package:widgets_to_catalog/widgets/action_button.dart'
    as _widgets_to_catalog_widgets_action_button;
import 'package:widgets_to_catalog/widgets/badge.dart'
    as _widgets_to_catalog_widgets_badge;
import 'package:widgets_to_catalog/widgets/info_list_tile.dart'
    as _widgets_to_catalog_widgets_info_list_tile;
import 'package:widgets_to_catalog/widgets/mini_form_field.dart'
    as _widgets_to_catalog_widgets_mini_form_field;
import 'package:widgets_to_catalog/widgets/primary_tab_bar.dart'
    as _widgets_to_catalog_widgets_primary_tab_bar;
import 'package:widgets_to_catalog/widgets/product_card.dart'
    as _widgets_to_catalog_widgets_product_card;
import 'package:widgets_to_catalog/widgets/profile_avatar.dart'
    as _widgets_to_catalog_widgets_profile_avatar;
import 'package:widgets_to_catalog/widgets/rating_row.dart'
    as _widgets_to_catalog_widgets_rating_row;
import 'package:widgets_to_catalog/widgets/search_bar.dart'
    as _widgets_to_catalog_widgets_search_bar;
import 'package:widgets_to_catalog/widgets/star_on_card.dart'
    as _widgets_to_catalog_widgets_star_on_card;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'ActionButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _widgets_to_catalog_widgets_action_button.actionButtonDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Loading State',
            builder:
                _widgets_to_catalog_widgets_action_button.actionButtonLoading,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Icon',
            builder:
                _widgets_to_catalog_widgets_action_button.actionButtonWithIcon,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'Badge',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgets_to_catalog_widgets_badge.badgeDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Number Badge',
            builder: _widgets_to_catalog_widgets_badge.badgeNumber,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Overflow Text',
            builder: _widgets_to_catalog_widgets_badge.badgeOverflow,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Status Badge',
            builder: _widgets_to_catalog_widgets_badge.badgeStatus,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'CustomSearchBar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgets_to_catalog_widgets_search_bar.searchBarDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Disabled',
            builder: _widgets_to_catalog_widgets_search_bar.searchBarDisabled,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Filter Icon',
            builder: _widgets_to_catalog_widgets_search_bar.searchBarWithFilter,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'InfoListTile',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _widgets_to_catalog_widgets_info_list_tile.infoListTileDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Disabled',
            builder:
                _widgets_to_catalog_widgets_info_list_tile.infoListTileDisabled,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Switch',
            builder: _widgets_to_catalog_widgets_info_list_tile
                .infoListTileWithSwitch,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'MiniFormField',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgets_to_catalog_widgets_mini_form_field
                .miniFormFieldDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Multiline',
            builder: _widgets_to_catalog_widgets_mini_form_field
                .miniFormFieldMultiline,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Password Field',
            builder: _widgets_to_catalog_widgets_mini_form_field
                .miniFormFieldPassword,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Error',
            builder:
                _widgets_to_catalog_widgets_mini_form_field.miniFormFieldError,
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
        name: 'ProductCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _widgets_to_catalog_widgets_product_card.productCardDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Favorite',
            builder:
                _widgets_to_catalog_widgets_product_card.productCardFavorite,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'No Rating',
            builder:
                _widgets_to_catalog_widgets_product_card.productCardNoRating,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'ProfileAvatar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _widgets_to_catalog_widgets_profile_avatar.profileAvatarDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Offline Status',
            builder:
                _widgets_to_catalog_widgets_profile_avatar.profileAvatarOffline,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Status Badge',
            builder: _widgets_to_catalog_widgets_profile_avatar
                .profileAvatarWithStatus,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'RatingRow',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgets_to_catalog_widgets_rating_row.ratingRowDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Interactive',
            builder:
                _widgets_to_catalog_widgets_rating_row.ratingRowInteractive,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Label',
            builder: _widgets_to_catalog_widgets_rating_row.ratingRowWithLabel,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'StarOnCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgets_to_catalog_widgets_star_on_card.starOnCardDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Starred with Badge',
            builder: _widgets_to_catalog_widgets_star_on_card
                .starOnCardStarredWithBadge,
          ),
        ],
      ),
    ],
  ),
];
