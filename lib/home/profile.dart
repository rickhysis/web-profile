import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickhy_siswanto_web/provider/theme.dart';
import 'package:url_launcher/link.dart';
import 'package:simple_icons/simple_icons.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(themeStateNotifier);
    final bool isResponsive = MediaQuery.of(context).size.width < 550.0;
    Color theme = darkMode ? Colors.black54 : Colors.white;
    Color textColor = darkMode ? Colors.white : Colors.black87;

    return SizedBox(
      child: Card(
        color: theme,
        child: Column(
          children: [
            Image.asset(
              'lib/assets/images/profile_bw.jpg',
              //width: 500,
              height: isResponsive ? 450 : null,
              fit: isResponsive ? BoxFit.cover : BoxFit.fill,
              alignment: Alignment.topLeft,
            ),
            const Divider(),
            ListTile(
              title: Link(
                uri: Uri.parse('https://wa.me/6282139003992?text=Hey+Brow'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return TextButton(
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    onPressed: openLink,
                    child: Text('+6282139003992',
                        style: TextStyle(color: textColor, fontSize: 16)),
                  );
                },
              ),
              leading: Icon(
                SimpleIcons.whatsapp,
                color: textColor,
                size: 22,
              ),
            ),
            const Divider(),
            ListTile(
              title: Link(
                uri: Uri.parse('mailto:@rikhysiswanto@gmail.com'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return TextButton(
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    onPressed: openLink,
                    child: Text('rickhysiswanto@gmail.com',
                        style: TextStyle(color: textColor, fontSize: 16)),
                  );
                },
              ),
              leading: Icon(Icons.contact_mail, color: textColor, size: 22),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Link(
                  uri: Uri.parse('https://github.com/rickhysis'),
                  target: LinkTarget.blank,
                  builder: (BuildContext ctx, FollowLink? openLink) {
                    return TextButton.icon(
                      onPressed: openLink,
                      label: const Text(''),
                      icon: Icon(
                        SimpleIcons.github,
                        color: textColor,
                        size: isResponsive ? 22 : 30,
                      ),
                    );
                  },
                ),
                Link(
                  uri: Uri.parse('https://www.linkedin.com/in/rickhy-siswanto-9494aa137/'),
                  target: LinkTarget.blank,
                  builder: (BuildContext ctx, FollowLink? openLink) {
                    return TextButton.icon(
                      onPressed: openLink,
                      label: const Text(''),
                      icon: Icon(SimpleIcons.linkedin, color: textColor, size: isResponsive ? 22 : 30),
                    );
                  },
                ),
                Link(
                  uri: Uri.parse('https://rickhysiswanto.medium.com/'),
                  target: LinkTarget.blank,
                  builder: (BuildContext ctx, FollowLink? openLink) {
                    return TextButton.icon(
                      onPressed: openLink,
                      label: const Text(''),
                      icon: Icon(SimpleIcons.medium, color: textColor, size: isResponsive ? 22 : 30,),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
