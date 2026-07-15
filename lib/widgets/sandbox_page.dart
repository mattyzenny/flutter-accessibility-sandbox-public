import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

final ValueNotifier<bool> _webAccessibilityEnabled = ValueNotifier(false);
SemanticsHandle? _webAccessibilityHandle;

void _setWebAccessibilityEnabled(bool enabled) {
  if (!kIsWeb || enabled == _webAccessibilityEnabled.value) {
    return;
  }

  if (enabled) {
    _webAccessibilityHandle ??= SemanticsBinding.instance.ensureSemantics();
  } else {
    _webAccessibilityHandle?.dispose();
    _webAccessibilityHandle = null;
  }

  _webAccessibilityEnabled.value = enabled;
}

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
    final showToggleLabels = MediaQuery.sizeOf(context).width >= 720;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          if (kIsWeb)
            ValueListenableBuilder<bool>(
              valueListenable: _webAccessibilityEnabled,
              builder: (context, enabled, child) {
                return _AppBarToggle(
                  icon: Icons.accessibility_new,
                  label: 'Web accessibility',
                  tooltip: enabled
                      ? 'Disable the Flutter web accessibility tree'
                      : 'Enable the Flutter web accessibility tree',
                  showLabel: showToggleLabels,
                  value: enabled,
                  onChanged: _setWebAccessibilityEnabled,
                );
              },
            ),
          _AppBarToggle(
            icon: Icons.account_tree_outlined,
            label: 'Semantics debugger',
            tooltip: showSemanticsDebugger
                ? 'Hide the semantics debugger overlay'
                : 'Show the semantics debugger overlay',
            showLabel: showToggleLabels,
            value: showSemanticsDebugger,
            onChanged: onToggleSemantics,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}

class _AppBarToggle extends StatelessWidget {
  const _AppBarToggle({
    required this.icon,
    required this.label,
    required this.tooltip,
    required this.showLabel,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final String tooltip;
  final bool showLabel;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: label,
      child: Tooltip(
        message: tooltip,
        excludeFromSemantics: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExcludeSemantics(child: Icon(icon, size: 20)),
            if (showLabel) ...[
              const SizedBox(width: 6),
              ExcludeSemantics(child: Text(label)),
            ],
            Switch(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
