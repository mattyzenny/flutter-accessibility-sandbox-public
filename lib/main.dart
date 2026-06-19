import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<bool> showSemanticsDebugger = ValueNotifier(false);
  Color _seedColor = Colors.deepPurple;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget app = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
      ),
      home: HomePage(
        // title: 'Flutter Demo Home Page',
        showSemanticsDebugger: showSemanticsDebugger.value,
        onToggleSemantics: (value) {
          setState(() {
            showSemanticsDebugger.value = value;
          });
        },
        onChangeTheme: () {
          setState(() {
            _seedColor = _seedColor == Colors.deepPurple
                ? Colors.amber
                : Colors.deepPurple;
          });
        },
      ),
      builder: (context, child) {
        if (showSemanticsDebugger.value) {
          return SemanticsDebugger(child: child!);
        }
        return child!;
      },
    );

    return app;
  }
}
