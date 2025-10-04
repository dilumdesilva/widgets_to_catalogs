import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgets_to_catalog/widgets/generic/primary_tab_bar.dart';
import '../common/scaffold_wrapper.dart';

@UseCase(
  name: 'Two Tabs',
  type: PrimaryTabBar,
)
Widget primaryTabBarTwoTabs(BuildContext context) {
  return wrapInScaffold(
    PrimaryTabBar(
      tabs: [
        TabData(
          label: context.knobs.string(
            label: 'Tab 1 Label',
            initialValue: 'Home',
          ),
          icon: context.knobs.list<IconData?>(
            label: 'Tab 1 Icon',
            options: [Icons.home, null],
            labelBuilder: (icon) => icon == null ? 'None' : 'Home',
          ),
        ),
        TabData(
          label: context.knobs.string(
            label: 'Tab 2 Label',
            initialValue: 'Search',
          ),
          icon: context.knobs.list<IconData?>(
            label: 'Tab 2 Icon',
            options: [Icons.search, null],
            labelBuilder: (icon) => icon == null ? 'None' : 'Search',
          ),
        ),
      ],
      initialIndex: context.knobs.int.slider(
        label: 'Initial Index',
        initialValue: 0,
        min: 0,
        max: 1,
      ),
    ),
    title: 'Primary Tab Bar',
  );
}

@UseCase(
  name: 'Four Tabs',
  type: PrimaryTabBar,
)
Widget primaryTabBarFourTabs(BuildContext context) {
  return wrapInScaffold(
    const PrimaryTabBar(
      tabs: [
        TabData(label: 'Home', icon: Icons.home),
        TabData(label: 'Search', icon: Icons.search),
        TabData(label: 'Favorites', icon: Icons.favorite),
        TabData(label: 'Profile', icon: Icons.person),
      ],
      initialIndex: 0,
    ),
    title: 'Primary Tab Bar',
  );
}

@UseCase(
  name: 'Text Only',
  type: PrimaryTabBar,
)
Widget primaryTabBarTextOnly(BuildContext context) {
  return wrapInScaffold(
    const PrimaryTabBar(
      tabs: [
        TabData(label: 'All'),
        TabData(label: 'Popular'),
        TabData(label: 'Recent'),
      ],
      initialIndex: 1,
    ),
    title: 'Primary Tab Bar',
  );
}
