import 'package:flutter/material.dart';
import '../widgets/sandbox_page.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({
    super.key,
    required this.showSemanticsDebugger,
    required this.onToggleSemantics,
  });

  final bool showSemanticsDebugger;
  final void Function(bool) onToggleSemantics;

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  bool _showBanner = false;

  void _announceMessage() {
    setState(() {
      _showBanner = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showBanner = false;
      });
    });
  }

  void _triggerToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a toast message!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SandboxPage(
      title: 'Toast/Alert',
      showSemanticsDebugger: widget.showSemanticsDebugger,
      onToggleSemantics: widget.onToggleSemantics,
      child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            // Section Intro Text
            Semantics(
              header: true,
              child: Text(
                'Toast Message',
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
                      const Text('Toast SnackBar'),
                      ElevatedButton(
                        onPressed: _triggerToast,
                        child: const Text('Show Toast'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Semantics(
              header: true,
              child: Text(
                'Custom Live Region Message',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(width: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center side
                Expanded(
                  child: Column(
                    spacing: 16,
                    children: [
                      const Text('Custom Live Region'),
                      ElevatedButton(
                        onPressed: _announceMessage,
                        child: const Text('Show Message'),
                      ),
                      if (_showBanner)
                        Semantics(
                          container: true,
                          liveRegion: true,
                          label: 'live region',
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.warning, color: Colors.white),
                                  SizedBox(width: 15),
                                  Flexible(
                                    child: Text(
                                      'Custom Live Region',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            Semantics(
              header: true,
              child: Text(
                'Error Message',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(width: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text('Validator'),
                                Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your name',
                                      labelText: 'Name *',
                                      // helperText: ' ',
                                    ),
                                    validator: (String? value) {
                                      if (value != null && value.length > 3) {
                                        return 'Please enter some text';
                                      }
                                      if (value!.contains('*')) {
                                        return 'No Stars Allowed';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '*Immediate Validation*',
                                  style: TextStyle(color: Colors.red),
                                ),
                                Form(
                                  key: _formKey2,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your name',
                                      labelText: 'Name *',
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (String? value) {
                                      if (value != null && value.length > 3) {
                                        return 'Please enter some text';
                                      }
                                      if (value!.contains('*')) {
                                        return 'No Stars Allowed';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
                        child: const Text('Validate'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
