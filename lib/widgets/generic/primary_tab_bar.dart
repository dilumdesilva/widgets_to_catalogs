import 'package:flutter/material.dart';

class PrimaryTabBar extends StatefulWidget {
  const PrimaryTabBar({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.onTabChanged,
    this.backgroundColor,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
  });

  final List<TabData> tabs;
  final int initialIndex;
  final ValueChanged<int>? onTabChanged;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  @override
  State<PrimaryTabBar> createState() => _PrimaryTabBarState();
}

class _PrimaryTabBarState extends State<PrimaryTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      widget.onTabChanged?.call(_tabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        tabs: widget.tabs
            .map((tab) => Tab(
                  icon: tab.icon != null ? Icon(tab.icon) : null,
                  text: tab.label,
                ))
            .toList(),
        indicatorColor: widget.indicatorColor ?? theme.colorScheme.primary,
        labelColor: widget.labelColor ?? theme.colorScheme.primary,
        unselectedLabelColor: widget.unselectedLabelColor ??
            theme.colorScheme.onSurfaceVariant,
        indicatorWeight: 3,
        labelStyle: theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: theme.textTheme.titleSmall,
      ),
    );
  }
}

class TabData {
  const TabData({
    required this.label,
    this.icon,
  });

  final String label;
  final IconData? icon;
}