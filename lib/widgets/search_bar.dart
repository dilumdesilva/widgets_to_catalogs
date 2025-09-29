import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.hintText = 'Search...',
    this.prefixIcon = Icons.search,
    this.showClearButton = true,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.enabled = true,
  });

  final String hintText;
  final IconData prefixIcon;
  final bool showClearButton;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final bool enabled;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
    widget.onChanged?.call(_controller.text);
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      enabled: widget.enabled,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.showClearButton && _hasText
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _clearText,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: CustomSearchBar,
)
Widget searchBarDefault(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: CustomSearchBar(
      hintText: context.knobs.string(
        label: 'Hint Text',
        initialValue: 'Search products...',
      ),
      prefixIcon: context.knobs.list<IconData>(
        label: 'Prefix Icon',
        options: [Icons.search, Icons.filter_list, Icons.location_on],
        labelBuilder: (icon) {
          if (icon == Icons.search) return 'Search';
          if (icon == Icons.filter_list) return 'Filter';
          if (icon == Icons.location_on) return 'Location';
          return 'Unknown';
        },
      ),
      showClearButton: context.knobs.boolean(
        label: 'Show Clear Button',
        initialValue: true,
      ),
      enabled: context.knobs.boolean(
        label: 'Enabled',
        initialValue: true,
      ),
    ),
  );
}

@UseCase(
  name: 'With Filter Icon',
  type: CustomSearchBar,
)
Widget searchBarWithFilter(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: CustomSearchBar(
      hintText: 'Filter items...',
      prefixIcon: Icons.filter_list,
      showClearButton: true,
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: CustomSearchBar,
)
Widget searchBarDisabled(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: CustomSearchBar(
      hintText: 'Search disabled...',
      prefixIcon: Icons.search,
      enabled: false,
    ),
  );
}