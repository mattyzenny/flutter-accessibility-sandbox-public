// lib/pages/dialog_page.dart

import 'package:flutter/material.dart';
import '../widgets/sandbox_page.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({
    super.key,
    required this.showSemanticsDebugger,
    required this.onToggleSemantics,
  });

  final bool showSemanticsDebugger;
  final void Function(bool) onToggleSemantics;

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void _showExampleAlertDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            autofocus: true,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showExampleAlertDialogSemanticLabel() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        semanticLabel: 'Delete Confirmation',
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            autofocus: true,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showExampleAlertDialogBoth() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        semanticLabel: 'Delete Confirmation',
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            autofocus: true,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showExampleDialogNoSemantics() {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Are you sure you want to delete this item?'),
            TextButton(
              autofocus: true,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  void _showExampleDialogSemanticsWrapper() {
    showDialog<void>(
      context: context,
      builder: (context) => Semantics(
        label: 'Delete Confirmation',
        container: true,
        child: Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you sure you want to delete this item?'),
              TextButton(
                autofocus: true,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExampleDialogSemanticsChild() {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        child: Semantics(
          label: 'Delete Confirmation',
          container: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you sure you want to delete this item?'),
              TextButton(
                autofocus: true,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // This widget is the root of your page.
  @override
  Widget build(BuildContext context) {
    return SandboxPage(
      title: 'Dialogs',
      showSemanticsDebugger: widget.showSemanticsDebugger,
      onToggleSemantics: widget.onToggleSemantics,
      child: Column(
        spacing: 24,
        children: [
          // Section Intro Text
          Semantics(
            header: true,
            child: Text(
              'Alert Dialogs',
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
                    const Text('With title'),
                    TextButton(
                      onPressed: _showExampleAlertDialog,
                      child: const Text('Show Dialog'),
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
                    const Text('With semanticLabel'),
                    TextButton(
                      onPressed: _showExampleAlertDialogSemanticLabel,
                      child: const Text('Show Dialog'),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Both semanticLabel and title'),
                    TextButton(
                      onPressed: _showExampleAlertDialogBoth,
                      child: const Text('Show Dialog'),
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
              'Dialogs',
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
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline),
                      tooltip: 'Show Dialog',
                      onPressed: _showExampleDialogNoSemantics,
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
                    const Text('With Semantics Inside Dialog'),
                    IconButton(
                      tooltip: 'Show Dialog',
                      icon: const Icon(Icons.chat_bubble_outline),
                      onPressed: _showExampleDialogSemanticsChild,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: Column(
                  spacing: 16,
                  children: [
                    const Text('With Semantics Wrapping Dialog'),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline),
                      tooltip: 'Show Dialog',
                      onPressed: _showExampleDialogSemanticsWrapper,
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
