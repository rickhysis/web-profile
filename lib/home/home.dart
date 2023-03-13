import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickhy_siswanto_web/constants.dart';
import 'package:rickhy_siswanto_web/home/content.dart';
import 'package:rickhy_siswanto_web/home/profile.dart';
import 'package:rickhy_siswanto_web/provider/theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(themeStateNotifier);
    final bool isResponsive = MediaQuery.of(context).size.width < 550.0;
    Color theme = darkMode ? Colors.black87 : Colors.white;
    Color textColor = darkMode ? Colors.white : Colors.black87;

    return Scaffold(
        backgroundColor: theme,
        appBar: AppBar(
          centerTitle: isResponsive,
          title: Text(headerText,
              textScaleFactor: isResponsive ? 1 : 2,
              style: TextStyle(color: textColor)),
          backgroundColor: theme,
          foregroundColor: theme,
          actions: <Widget>[
            Text('Build with flutter', style: TextStyle(color: textColor)),
            Switch(
              // This bool value toggles the switch.
              value: darkMode,
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black87,
              onChanged: (bool value) {
                if (darkMode) {
                  ref.read(themeStateNotifier.notifier).setLightTheme();
                } else {
                  ref.read(themeStateNotifier.notifier).setDarkTheme();
                }
              },
            )
          ],
        ),
        body: const AdaptiveContainer());
  }
}

class AdaptiveContainer extends ConsumerWidget {
  const AdaptiveContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (MediaQuery.of(context).size.width < 550.0) {
      return ListView(
        children: const [
          ProfilePage(),
          //Divider(),
          ContentPage(),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Expanded(
            child: ProfilePage(),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20),
              child: ContentPage(),
            ),
          ),
        ],
      );
    }
  }
}
