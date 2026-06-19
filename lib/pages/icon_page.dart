import 'package:flutter/material.dart';
import '../widgets/sandbox_page.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({
    super.key,
    required this.showSemanticsDebugger,
    required this.onToggleSemantics,
  });

  final bool showSemanticsDebugger;
  final void Function(bool) onToggleSemantics;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return SandboxPage(
      title: 'Icon/Image',
      showSemanticsDebugger: widget.showSemanticsDebugger,
      onToggleSemantics: widget.onToggleSemantics,
      child: const SizedBox.shrink(),
    );
  }
}
