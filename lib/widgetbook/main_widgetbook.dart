import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../themes/app_themes.dart';

// Import all widget files to ensure UseCase annotations are discovered
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/primary_tab_bar.dart';
import '../widgets/star_on_card.dart';
import '../widgets/action_button.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/info_list_tile.dart';
import '../widgets/rating_row.dart';
import '../widgets/badge.dart';
import '../widgets/mini_form_field.dart';

// Import the generated widgetbook
import 'main_widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: AppThemes.lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: AppThemes.darkTheme,
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone12,
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyS20,
            Devices.windows.laptop,
            Devices.macOS.macBookPro,
          ],
        ),
        TextScaleAddon(
          scales: [0.8, 1.0, 1.2, 1.4, 1.6, 2.0],
        ),
        AlignmentAddon(),
        InspectorAddon(),
      ],
      appBuilder: (context, child) {
        return child;
      },
    );
  }
}