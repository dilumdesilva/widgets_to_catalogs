import 'package:flutter/material.dart';

/// Wraps a widget in a Scaffold with AppBar for realistic preview in Widgetbook
Widget wrapInScaffold(Widget child, {String title = 'Widget Preview'}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0,
    ),
    body: Container(
      color: const Color(0xFFF5F5F5), // Light gray background
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    ),
  );
}
