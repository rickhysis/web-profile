import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickhy_siswanto_web/constants.dart';
import 'package:rickhy_siswanto_web/provider/theme.dart';

class ProfileBoxPage extends ConsumerWidget {
  const ProfileBoxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: ListProfileBoxPage(
                    valueText: projectsValueText,
                    subText: projectText,
                    descriptionText: projectDescription),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListProfileBoxPage(
                    valueText: appliationsValueText,
                    subText: applicationText,
                    descriptionText: appliactionDescription),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: ListProfileBoxPage(
                    valueText: technicalValueText,
                    subText: technicalText,
                    descriptionText: technicalDescription),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListProfileBoxPage(
                    valueText: leadingValueText,
                    subText: leadingText,
                    descriptionText: leadingDescription),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

@immutable
class ListProfileBoxPage extends ConsumerWidget {
  final String valueText, subText, descriptionText;
  const ListProfileBoxPage(
      {super.key,
      required this.valueText,
      required this.subText,
      required this.descriptionText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(themeStateNotifier);
    Color textColor = darkMode ? Colors.white : Colors.black87;

    return ListTile(
      contentPadding: const EdgeInsets.all(25.0),
      tileColor: Colors.blueGrey.shade200,
      textColor: textColor,
      leading: ExcludeSemantics(
        child: CircleAvatar(
            radius: 50, child: Text(valueText, textScaleFactor: 1.5)),
      ),
      title: Text(subText, textScaleFactor: 2),
      subtitle: Text(descriptionText),
    );
  }
}
