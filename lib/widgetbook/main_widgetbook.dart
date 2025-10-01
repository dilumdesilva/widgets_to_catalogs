import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../themes/app_themes.dart';
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
        // AlignmentAddon(),
        InspectorAddon(),
      ],
      appBuilder: (context, child) {
        return child;
      },
    );
  }
}