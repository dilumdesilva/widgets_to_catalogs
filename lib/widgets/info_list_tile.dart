import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class InfoListTile extends StatelessWidget {
  const InfoListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingAction,
    this.onTap,
    this.enabled = true,
  });

  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final Widget? trailingAction;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      enabled: enabled,
      leading: leadingIcon != null
          ? Icon(
              leadingIcon,
              color: enabled
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withOpacity(0.38),
            )
          : null,
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          color: enabled
              ? theme.colorScheme.onSurface
              : theme.colorScheme.onSurface.withOpacity(0.38),
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: enabled
                    ? theme.colorScheme.onSurfaceVariant
                    : theme.colorScheme.onSurface.withOpacity(0.38),
              ),
            )
          : null,
      trailing: trailingAction,
      onTap: enabled ? onTap : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}

@UseCase(
  name: 'Default',
  type: InfoListTile,
)
Widget infoListTileDefault(BuildContext context) {
  return InfoListTile(
    title: context.knobs.string(
      label: 'Title',
      initialValue: 'Settings',
    ),
    subtitle: context.knobs.string(
      label: 'Subtitle',
      initialValue: 'Configure your preferences',
    ),
    leadingIcon: context.knobs.list<IconData?>(
      label: 'Leading Icon',
      options: [null, Icons.settings, Icons.person, Icons.info],
      labelBuilder: (icon) {
        if (icon == null) return 'None';
        if (icon == Icons.settings) return 'Settings';
        if (icon == Icons.person) return 'Person';
        if (icon == Icons.info) return 'Info';
        return 'Unknown';
      },
    ),
    enabled: context.knobs.boolean(
      label: 'Enabled',
      initialValue: true,
    ),
    trailingAction: context.knobs.list<Widget?>(
      label: 'Trailing Action',
      options: [null, Icon(Icons.chevron_right), Switch(value: true, onChanged: null)],
      labelBuilder: (widget) {
        if (widget == null) return 'None';
        if (widget is Icon) return 'Arrow';
        if (widget is Switch) return 'Switch';
        return 'Unknown';
      },
    ),
  );
}

@UseCase(
  name: 'With Switch',
  type: InfoListTile,
)
Widget infoListTileWithSwitch(BuildContext context) {
  return InfoListTile(
    title: 'Notifications',
    subtitle: 'Enable push notifications',
    leadingIcon: Icons.notifications,
    trailingAction: Switch(
      value: true,
      onChanged: (value) {},
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: InfoListTile,
)
Widget infoListTileDisabled(BuildContext context) {
  return const InfoListTile(
    title: 'Premium Feature',
    subtitle: 'Upgrade to access this feature',
    leadingIcon: Icons.star,
    enabled: false,
    trailingAction: Icon(Icons.lock),
  );
}