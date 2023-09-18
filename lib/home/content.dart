import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickhy_siswanto_web/components/profile_box.dart';
import 'package:rickhy_siswanto_web/constants.dart';
import 'package:rickhy_siswanto_web/provider/theme.dart';

class ContentPage extends ConsumerWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(themeStateNotifier);
    Color textColor = darkMode ? Colors.white : Colors.black87;

    return Column(
      children: [
        Chip(
          padding: const EdgeInsets.all(10.0),
          label: Text(passiontText,
              textScaleFactor: 2,
              style: TextStyle(color: textColor, fontStyle: FontStyle.italic)),
        ),
        const Divider(),
        ListProfileBoxPage(
            valueText: projectsValueText,
            subText: projectText,
            descriptionText: projectDescription),
        const Divider(),
        ListProfileBoxPage(
            valueText: appliationsValueText,
            subText: applicationText,
            descriptionText: appliactionDescription),
        const Divider(),
        ListProfileBoxPage(
            valueText: technicalValueText,
            subText: technicalText,
            descriptionText: technicalDescription),
        const Divider(),
        ListProfileBoxPage(
            valueText: leadingValueText,
            subText: leadingText,
            descriptionText: leadingDescription),
        const Divider(),
        Text(greetingMessage,
            textScaleFactor: 1,
            style: TextStyle(color: textColor, fontStyle: FontStyle.italic)),
      ],
    );
  }
}
