import 'package:flutter/material.dart';

class SandboxPage extends StatelessWidget {
  const SandboxPage({
    super.key,
    required this.title,
    required this.child,
    required this.showSemanticsDebugger,
    required this.onToggleSemantics,
  });

  final String title;
  final Widget child;
  final bool showSemanticsDebugger;
  final void Function(bool) onToggleSemantics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          Switch(value: showSemanticsDebugger, onChanged: onToggleSemantics),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
