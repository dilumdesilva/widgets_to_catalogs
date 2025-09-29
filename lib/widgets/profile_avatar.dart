import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../utils/placeholder_image.dart';

enum AvatarSize { small, medium, large, extraLarge }

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.initials,
    this.imageUrl,
    this.size = AvatarSize.medium,
    this.showStatusBadge = false,
    this.isOnline = false,
    this.onTap,
    this.backgroundColor,
  });

  final String? initials;
  final String? imageUrl;
  final AvatarSize size;
  final bool showStatusBadge;
  final bool isOnline;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  double get _radius {
    switch (size) {
      case AvatarSize.small:
        return 16;
      case AvatarSize.medium:
        return 24;
      case AvatarSize.large:
        return 32;
      case AvatarSize.extraLarge:
        return 48;
    }
  }

  double get _badgeSize {
    switch (size) {
      case AvatarSize.small:
        return 8;
      case AvatarSize.medium:
        return 10;
      case AvatarSize.large:
        return 12;
      case AvatarSize.extraLarge:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget avatar = CircularPlaceholderImage(
      radius: _radius,
      text: initials,
      backgroundColor: backgroundColor,
    );

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_radius),
        child: avatar,
      );
    }

    if (showStatusBadge) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: _badgeSize,
              height: _badgeSize,
              decoration: BoxDecoration(
                color: isOnline ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return avatar;
  }
}

@UseCase(
  name: 'Default',
  type: ProfileAvatar,
)
Widget profileAvatarDefault(BuildContext context) {
  return ProfileAvatar(
    initials: context.knobs.string(
      label: 'Initials',
      initialValue: 'JD',
    ),
    size: context.knobs.list<AvatarSize>(
      label: 'Size',
      options: [AvatarSize.small, AvatarSize.medium, AvatarSize.large, AvatarSize.extraLarge],
      labelBuilder: (size) => size.name.toUpperCase(),
    ),
    showStatusBadge: context.knobs.boolean(
      label: 'Show Status Badge',
      initialValue: false,
    ),
    isOnline: context.knobs.boolean(
      label: 'Is Online',
      initialValue: true,
    ),
  );
}

@UseCase(
  name: 'With Status Badge',
  type: ProfileAvatar,
)
Widget profileAvatarWithStatus(BuildContext context) {
  return const ProfileAvatar(
    initials: 'AB',
    size: AvatarSize.large,
    showStatusBadge: true,
    isOnline: true,
  );
}

@UseCase(
  name: 'Offline Status',
  type: ProfileAvatar,
)
Widget profileAvatarOffline(BuildContext context) {
  return const ProfileAvatar(
    initials: 'XY',
    size: AvatarSize.medium,
    showStatusBadge: true,
    isOnline: false,
  );
}