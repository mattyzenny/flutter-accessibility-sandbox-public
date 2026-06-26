import 'package:flutter/material.dart';
import '../widgets/sandbox_page.dart';
import '../widgets/code_snippet_template.dart';
import '../widgets/at_description_template.dart';

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
          // ---------------------------------------------------------------------------
          // Decorative Icons and Images
          // ---------------------------------------------------------------------------
          Semantics(
            header: true,
            child: Text(
              'Decorative',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image: ExcludeSemantics
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    ExcludeSemantics(
                      child: _profileImage('assets/images/pluto.jpeg'),
                    ),
                    const ATDescriptionTemplate(
                      icon: Icons.check_circle_outline_outlined,
                      iconStyle: IconThemeData(color: Colors.green),
                      description: 'Image ExcludeSemantics',
                      ios: 'TODO',
                      chrome: 'TODO',
                      safari: 'TODO',
                    ),
                    const CodeSnippetTemplate(
                      code: '''ExcludeSemantics(
  child: _profileImage('assets/images/pluto.jpeg'),
)''',
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // Icon: ExcludeSemantics
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    ExcludeSemantics(
                      child: _profileIcon(Icons.accessibility_new_rounded),
                    ),
                    const ATDescriptionTemplate(
                      icon: Icons.check_circle_outline_outlined,
                      iconStyle: IconThemeData(color: Colors.green),
                      description: 'Icon ExcludeSemantics',
                      ios: 'TODO',
                      chrome: 'TODO',
                      safari: 'TODO',
                    ),
                    const CodeSnippetTemplate(
                      code: '''ExcludeSemantics(
  child: _profileIcon(Icons.accessibility_new_rounded),
)''',
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ---------------------------------------------------------------------------
          // Informative Icons and Images
          // ---------------------------------------------------------------------------
          Semantics(
            header: true,
            child: Text(
              'Informative',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image: Semantics wrapper
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    Semantics(
                      label: 'pluto',
                      child: _profileImage('assets/images/pluto.jpeg'),
                    ),
                    const ATDescriptionTemplate(
                      icon: Icons.check_circle_outline_outlined,
                      iconStyle: IconThemeData(color: Colors.green),
                      description: 'Image Semantics',
                      ios: 'TODO',
                      chrome: 'TODO',
                      safari: 'TODO',
                    ),
                    const CodeSnippetTemplate(
                      code: '''Semantics(
  label: 'pluto',
  child: _profileImage('assets/images/pluto.jpeg'),
)''',
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // Image: semanticLabel property
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
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
                    const ATDescriptionTemplate(
                      icon: Icons.check_circle_outline_outlined,
                      iconStyle: IconThemeData(color: Colors.green),
                      description: 'Image With SemanticLabel',
                      ios: 'TODO',
                      chrome: 'TODO',
                      safari: 'TODO',
                    ),
                    const CodeSnippetTemplate(
                      code: '''Image.asset(
  'assets/images/pluto.jpeg',
  semanticLabel: 'pluto',
  fit: BoxFit.cover,
)''',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),

              // Icon: Semantics wrapper
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    Semantics(
                      label: 'accessibility',
                      child: _profileIcon(Icons.accessibility_new_rounded),
                    ),
                    const ATDescriptionTemplate(
                      icon: Icons.warning_amber,
                      iconStyle: IconThemeData(color: Colors.red, size: 16),
                      description: 'Icon Semantics',
                      descriptionStyle: TextStyle(color: Colors.red),
                      ios: 'TODO',
                      chrome: 'TODO',
                      safari: 'TODO',
                    ),
                    const CodeSnippetTemplate(
                      code: '''Semantics(
  label: 'accessibility',
  child: _profileIcon(Icons.accessibility_new_rounded),
)''',
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // Icon: Semantics wrapper + image role
              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    Semantics(
                      label: 'accessibility',
                      image: true,
                      child: _profileIcon(Icons.accessibility_new_rounded),
                    ),
                    const ATDescriptionTemplate(
                      icon: Icons.check_circle_outline_outlined,
                      iconStyle: IconThemeData(color: Colors.green),
                      description: 'Icon Semantics with image: true',
                      ios: 'TODO',
                      chrome: 'TODO',
                      safari: 'TODO',
                    ),
                    const CodeSnippetTemplate(
                      code: '''Semantics(
  label: 'accessibility',
  image: true,
  child: _profileIcon(Icons.accessibility_new_rounded),
)''',
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
