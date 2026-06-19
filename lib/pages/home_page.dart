import 'package:flutter/material.dart';
import '../widgets/sandbox_page.dart';
import 'button_page.dart';
import 'dialog_page.dart';
import 'icon_page.dart';
import 'toast_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.showSemanticsDebugger,
    required this.onToggleSemantics,
    required this.onChangeTheme,
  });

  final bool showSemanticsDebugger;
  final void Function(bool) onToggleSemantics;
  final VoidCallback onChangeTheme;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This widget is the root of your page.
  @override
  Widget build(BuildContext context) {
    return SandboxPage(
      title: 'Flutter Demo Home Page',
      showSemanticsDebugger: widget.showSemanticsDebugger,
      onToggleSemantics: widget.onToggleSemantics,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            const Text('Welcome to the Flutter Sandbox!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ButtonPage(
                      showSemanticsDebugger: widget.showSemanticsDebugger,
                      onToggleSemantics: widget.onToggleSemantics,
                      onChangeTheme: widget.onChangeTheme,
                    ),
                  ),
                );
              },
              child: const Text('Go to Buttons Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DialogPage(
                      showSemanticsDebugger: widget.showSemanticsDebugger,
                      onToggleSemantics: widget.onToggleSemantics,
                    ),
                  ),
                );
              },
              child: const Text('Go to Dialog Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlertPage(
                      showSemanticsDebugger: widget.showSemanticsDebugger,
                      onToggleSemantics: widget.onToggleSemantics,
                    ),
                  ),
                );
              },
              child: const Text('Go to Toast/Alert Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImagePage(
                      showSemanticsDebugger: widget.showSemanticsDebugger,
                      onToggleSemantics: widget.onToggleSemantics,
                    ),
                  ),
                );
              },
              child: const Text('Go to Icon/Image Page'),
            ),
          ],
        ),
      ),
    );
  }
}
