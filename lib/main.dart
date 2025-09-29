import 'package:flutter/material.dart';
import 'themes/app_themes.dart';
import 'widgets/product_card.dart';
import 'widgets/search_bar.dart';
import 'widgets/primary_tab_bar.dart';
import 'widgets/star_on_card.dart';
import 'widgets/action_button.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/info_list_tile.dart';
import 'widgets/rating_row.dart';
import 'widgets/badge.dart' as custom_badge;
import 'widgets/mini_form_field.dart';

void main() {
  runApp(const WidgetsCatalogApp());
}

class WidgetsCatalogApp extends StatelessWidget {
  const WidgetsCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets to Catalog Demo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const WidgetsDemoScreen(),
    );
  }
}

class WidgetsDemoScreen extends StatefulWidget {
  const WidgetsDemoScreen({super.key});

  @override
  State<WidgetsDemoScreen> createState() => _WidgetsDemoScreenState();
}

class _WidgetsDemoScreenState extends State<WidgetsDemoScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Catalog Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          PrimaryTabBar(
            tabs: const [
              TabData(label: 'Cards', icon: Icons.card_membership),
              TabData(label: 'Inputs', icon: Icons.input),
              TabData(label: 'Actions', icon: Icons.touch_app),
            ],
            initialIndex: _currentTabIndex,
            onTabChanged: (index) {
              setState(() {
                _currentTabIndex = index;
              });
            },
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_currentTabIndex) {
      case 0:
        return _buildCardsTab();
      case 1:
        return _buildInputsTab();
      case 2:
        return _buildActionsTab();
      default:
        return const Center(child: Text('Unknown tab'));
    }
  }

  Widget _buildCardsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Product Cards',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ProductCard(
                  title: 'Wireless Headphones',
                  subtitle: 'Premium Audio',
                  price: 99.99,
                  isFavorite: true,
                  rating: 4.5,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ProductCard(
                  title: 'Smart Watch',
                  subtitle: 'Fitness Tracker',
                  price: 199.99,
                  rating: 4.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Star Cards',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StarOnCard(
                  isStarred: true,
                  badgeCount: 3,
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text('Featured Content'),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StarOnCard(
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text('Regular Content'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search Bars',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const CustomSearchBar(
            hintText: 'Search products...',
            prefixIcon: Icons.search,
          ),
          const SizedBox(height: 24),
          const Text(
            'Form Fields',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const MiniFormField(
            labelText: 'Email',
            hintText: 'Enter your email',
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 16),
          const MiniFormField(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          const SizedBox(height: 24),
          const Text(
            'Rating',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const RatingRow(
            rating: 4,
            showLabel: true,
            isInteractive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildActionsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Buttons',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              ActionButton(
                label: 'Primary',
                variant: ActionButtonVariant.primary,
              ),
              ActionButton(
                label: 'Secondary',
                variant: ActionButtonVariant.secondary,
              ),
              ActionButton(
                label: 'Text',
                variant: ActionButtonVariant.text,
              ),
              ActionButton(
                label: 'With Icon',
                icon: Icons.download,
                variant: ActionButtonVariant.primary,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Profile Avatars',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              ProfileAvatar(
                initials: 'JD',
                size: AvatarSize.small,
              ),
              SizedBox(width: 12),
              ProfileAvatar(
                initials: 'AB',
                size: AvatarSize.medium,
                showStatusBadge: true,
                isOnline: true,
              ),
              SizedBox(width: 12),
              ProfileAvatar(
                initials: 'XY',
                size: AvatarSize.large,
                showStatusBadge: true,
                isOnline: false,
              ),
              SizedBox(width: 12),
              ProfileAvatar(
                initials: 'MN',
                size: AvatarSize.extraLarge,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Badges',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              custom_badge.Badge(text: 'New'),
              custom_badge.Badge(text: '42', color: Colors.red),
              custom_badge.Badge(text: 'Premium', color: Colors.green),
              custom_badge.Badge(text: 'Hot', color: Colors.orange),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'List Items',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              InfoListTile(
                title: 'Settings',
                subtitle: 'Configure your preferences',
                leadingIcon: Icons.settings,
                trailingAction: Icon(Icons.chevron_right),
              ),
              InfoListTile(
                title: 'Notifications',
                subtitle: 'Enable push notifications',
                leadingIcon: Icons.notifications,
                trailingAction: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              const InfoListTile(
                title: 'Premium Feature',
                subtitle: 'Upgrade to access',
                leadingIcon: Icons.star,
                enabled: false,
                trailingAction: Icon(Icons.lock),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
