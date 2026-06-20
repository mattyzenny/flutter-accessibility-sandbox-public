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
  static const double _profileIconSize = 96;
  static const double _profileBorderWidth = 6;

  Widget _profileImage(String assetPath) {
    return Container(
      width: _profileIconSize,
      height: _profileIconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: _profileBorderWidth),
      ),
      child: ClipOval(child: Image.asset(assetPath, fit: BoxFit.cover)),
    );
  }

  Widget _profileIcon(IconData icon) {
    return Container(
      width: _profileIconSize,
      height: _profileIconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: _profileBorderWidth),
      ),
      child: Icon(icon, size: 56),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SandboxPage(
      title: 'Icon/Image',
      showSemanticsDebugger: widget.showSemanticsDebugger,
      onToggleSemantics: widget.onToggleSemantics,
      child: Column(
        spacing: 24,
        children: [
          // Section Intro Text
          Semantics(
            header: true,
            child: Text(
              'Decorative',
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
                    const Text('Image ExcludeSemantics'),
                    ExcludeSemantics(
                      child: _profileImage('assets/images/pluto.jpeg'),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('Icon ExcludeSemantics'),
                    ExcludeSemantics(
                      child: _profileIcon(Icons.accessibility_new_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Semantics(
            header: true,
            child: Text(
              'Informative',
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
                    Text('Image Semantics'),
                    Semantics(
                      label: 'pluto',
                      child: _profileImage('assets/images/pluto.jpeg'),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    Text('Image With SemanticLabel'),
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 6),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/pluto.jpeg',
                          semanticLabel: 'pluto',
                          fit: BoxFit.cover,
                        ),
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
                    Text(
                      '*Icon Semantics*',
                      style: TextStyle(color: Colors.red),
                    ),
                    Semantics(
                      label: 'accessibility',
                      child: _profileIcon(Icons.accessibility_new_rounded),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('Icon Semantics with image: true'),
                    Semantics(
                      label: 'accessibility',
                      image: true,
                      child: _profileIcon(Icons.accessibility_new_rounded),
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
