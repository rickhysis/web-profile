import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './provider/theme.dart';
import './home/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(themeStateNotifier);
    Color textColor = darkMode ? Colors.white : Colors.black87;
    return MaterialApp(
      title: 'Rikhy Siswanto',
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      scrollBehavior: const MaterialScrollBehavior().copyWith(scrollbars: true),
      // theme: ThemeData(
      //   primarySwatch: themeValue ? Colors.black54 : Colors.grey.shade300,
      // ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: textColor), bodyLarge: TextStyle(color: textColor)),
      ),
      home: const HomePage(),
    );
  }
}
