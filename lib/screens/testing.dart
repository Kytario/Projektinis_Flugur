import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/screens/home_screen.dart';

import '../utils/theme_provider.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            "settings".tr().toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.flag,
                    iconStyle: IconStyle(),
                    title: 'languagess'.tr().toString(),
                    titleStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    subtitle: "stl".tr().toString(),
                  ),
                  SettingsItem(
                    onTap: () async {
                      context.locale = Locale('lt', 'LT');
                    },
                    icons: CupertinoIcons.flag,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'languagess'.tr().toString(),
                    subtitle: "ste".tr().toString(),
                    titleStyle: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SettingsItem(
                    onTap: () async {
                      context.locale = Locale('en', 'US');
                    },
                    icons: ThemeData == ThemeData.light()
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    ),
                    title: ThemeData == ThemeData.light()
                        ? "l_m".tr().toString()
                        : "d_m".tr().toString(),
                    subtitle: Theme.of(context).brightness == Brightness.light
                        ? "l_m1".tr().toString()
                        : "d_m2".tr().toString(),
                    titleStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    trailing: Switch.adaptive(
                      value: ThemeData == ThemeData.light(),
                      onChanged: (isOn) {
                        // final provider =
                        //     Provider.of<ThemeProvider>(context, listen: false);
                        // provider.toggleTheme(isOn);
                      },
                    ),
                  ),
                ],
              ),
              SettingsGroup(items: [
                SettingsItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRightWithFade,
                            child: HomeScreen()));
                  },
                  icons: Icons.home,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'home_screen'.tr().toString(),
                  titleStyle: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
