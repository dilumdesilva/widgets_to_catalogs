import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class MiniFormField extends StatefulWidget {
  const MiniFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.keyboardType,
  });

  final String? hintText;
  final String? labelText;
  final String? errorText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  State<MiniFormField> createState() => _MiniFormFieldState();
}

class _MiniFormFieldState extends State<MiniFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = widget.errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          enabled: widget.enabled,
          obscureText: widget.obscureText,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon)
                : null,
            suffixIcon: widget.suffixIcon,
            errorText: widget.errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: hasError
                    ? theme.colorScheme.error
                    : theme.colorScheme.outline,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: hasError
                    ? theme.colorScheme.error
                    : theme.colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}

@UseCase(
  name: 'Default',
  type: MiniFormField,
)
Widget miniFormFieldDefault(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: MiniFormField(
      labelText: context.knobs.string(
        label: 'Label Text',
        initialValue: 'Email',
      ),
      hintText: context.knobs.string(
        label: 'Hint Text',
        initialValue: 'Enter your email',
      ),
      prefixIcon: context.knobs.list<IconData?>(
        label: 'Prefix Icon',
        options: [null, Icons.email, Icons.person, Icons.lock],
        labelBuilder: (icon) {
          if (icon == null) return 'None';
          if (icon == Icons.email) return 'Email';
          if (icon == Icons.person) return 'Person';
          if (icon == Icons.lock) return 'Lock';
          return 'Unknown';
        },
      ),
      enabled: context.knobs.boolean(
        label: 'Enabled',
        initialValue: true,
      ),
    ),
  );
}

@UseCase(
  name: 'Password Field',
  type: MiniFormField,
)
Widget miniFormFieldPassword(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: MiniFormField(
      labelText: 'Password',
      hintText: 'Enter your password',
      prefixIcon: Icons.lock,
      suffixIcon: Icon(Icons.visibility_off),
      obscureText: true,
    ),
  );
}

@UseCase(
  name: 'With Error',
  type: MiniFormField,
)
Widget miniFormFieldError(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: MiniFormField(
      labelText: 'Email',
      hintText: 'Enter your email',
      prefixIcon: Icons.email,
      errorText: 'Please enter a valid email address',
    ),
  );
}

@UseCase(
  name: 'Multiline',
  type: MiniFormField,
)
Widget miniFormFieldMultiline(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: MiniFormField(
      labelText: 'Message',
      hintText: 'Enter your message here...',
      maxLines: 4,
      keyboardType: TextInputType.multiline,
    ),
  );
}