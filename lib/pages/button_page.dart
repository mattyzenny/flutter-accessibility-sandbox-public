// lib/pages/button_page.dart

import 'package:flutter/material.dart';
import '../widgets/sandbox_page.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({
    super.key,
    required this.showSemanticsDebugger,
    required this.onToggleSemantics,
    required this.onChangeTheme,
  });

  final bool showSemanticsDebugger;
  final void Function(bool) onToggleSemantics;
  final VoidCallback onChangeTheme;

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  // This widget is the root of your page.
  @override
  Widget build(BuildContext context) {
    return SandboxPage(
      title: 'Buttons',
      showSemanticsDebugger: widget.showSemanticsDebugger,
      onToggleSemantics: widget.onToggleSemantics,
      child: Column(
        spacing: 24,
        children: [
          // Section Intro Text
          Semantics(
            header: true,
            child: Text(
              'Icon Buttons',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          // Column examples
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('No Semantics'),
                    IconButton(
                      icon: const Icon(Icons.color_lens),
                      tooltip: 'Change Background Color',
                      onPressed: widget.onChangeTheme,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // Right side
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Semantics'),
                    Semantics(
                      label: 'Change Background With Semantics No Tooltip',
                      button: true,
                      child: IconButton(
                        icon: const Icon(Icons.color_lens_sharp),
                        onPressed: widget.onChangeTheme,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Both Semantics and Tooltip'),
                    Semantics(
                      label: 'Change Background With Semantics and Tooltip',
                      button: true,
                      child: IconButton(
                        icon: const Icon(Icons.color_lens),
                        tooltip: 'Change Background Color',
                        onPressed: widget.onChangeTheme,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Section Intro Text
          Semantics(
            header: true,
            child: Text(
              'Text Buttons',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('No Semantics'),
                    ElevatedButton(
                      onPressed: widget.onChangeTheme,
                      child: const Text('Change Background'),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // Right side
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Semantics'),
                    Semantics(
                      label: 'Change Background With Semantics No Tooltip',
                      button: true,
                      child: ElevatedButton(
                        onPressed: widget.onChangeTheme,
                        child: const Text('Change Background'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Both Semantics and Tooltip'),
                    Semantics(
                      label: 'Change Background With Semantics and Tooltip',
                      button: true,
                      child: ElevatedButton(
                        onPressed: widget.onChangeTheme,
                        child: const Text('Change Background'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Section Intro Text
          Semantics(
            header: true,
            child: Text(
              'Floating Action Buttons',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('No Semantics'),
                    FloatingActionButton(
                      heroTag: 'No Semantics',
                      tooltip: 'Change Background Color',
                      onPressed: widget.onChangeTheme,
                      child: const Icon(Icons.color_lens_rounded),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // Right side
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Semantics'),
                    Semantics(
                      label: 'Change Background With Semantics No Tooltip',
                      button: true,
                      child: FloatingActionButton(
                        heroTag: 'With Semantics',
                        onPressed: widget.onChangeTheme,
                        child: const Icon(Icons.color_lens_rounded),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Both Semantics and Tooltip'),
                    Semantics(
                      label: 'Change Background With Semantics and Tooltip',
                      button: true,
                      child: FloatingActionButton(
                        heroTag: 'With Both',
                        tooltip: 'Change Background Color',
                        onPressed: widget.onChangeTheme,
                        child: const Icon(Icons.color_lens_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
