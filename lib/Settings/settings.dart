import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:thedemo_flutter/Settings/app_localizations.dart';
import 'package:thedemo_flutter/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();

  static bool darkMode = false;

  static _SettingsState of(BuildContext context) =>
      context.findAncestorStateOfType<_SettingsState>();
}

enum Language { english, portuguese }

class _SettingsState extends State<Settings> {
  bool notificationsEnabled = true;
  Language _character = Language.english;

  currentLang() async {
    if (MyApp.of(context).getLocale() == Locale('en', 'ZA')) {
      _character = Language.english;
    } else {
      _character = Language.portuguese;
    }

    AdaptiveThemeMode savedTheme = await AdaptiveTheme.getThemeMode();
    if (savedTheme == AdaptiveThemeMode.dark)
      Settings.darkMode = true;
    else
      Settings.darkMode = false;
  }

  @override
  Widget build(BuildContext context) {
    currentLang();
    return SettingsList(
      sections: [
        SettingsSection(
          title: AppLocalizations.of(context).translate('2_string'),
          tiles: [
            SettingsTile(
              title: AppLocalizations.of(context).translate('3_string'),
              enabled: notificationsEnabled,
              leading: Icon(Icons.language),
              onPressed: (context) {
                showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                          title: Text(AppLocalizations.of(context)
                              .translate('4_string')),
                          content: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 110,
                                child: setButtons(),
                              )
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                                child: Text(AppLocalizations.of(context)
                                    .translate('5_string')))
                          ],
                        ));
              },
            ),
          ],
        ),
        SettingsSection(
          title: AppLocalizations.of(context).translate('6_string'),
          tiles: [
            SettingsTile.switchTile(
              title: AppLocalizations.of(context).translate('7_string'),
              enabled: notificationsEnabled,
              leading: Icon(Icons.palette),
              onToggle: (bool value) {
                Settings.darkMode = value;
                if (Settings.darkMode) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
              switchValue: Settings.darkMode,
            ),
          ],
        ),
        SettingsSection(
            title: AppLocalizations.of(context).translate('18_string'),
            tiles: [
              SettingsTile(
                  title: AppLocalizations.of(context).translate('18_string'),
                  enabled: notificationsEnabled,
                  leading: Icon(Icons.book),
                  onPressed: (context) {
                    const url = "https://flutter.dev/";
                    launch(url);
                  })
            ]),
      ],
    );
  }

  Widget setButtons() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(AppLocalizations.of(context).translate('17_string')),
            leading: Radio(
              value: Language.english,
              groupValue: _character,
              onChanged: (Language value) {
                setState(() {
                  _character = value;
                  MyApp.of(context).setLocal(Locale('en', 'ZA'));
                  Navigator.of(context, rootNavigator: true).pop();
                });
              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('16_string')),
            leading: Radio(
                value: Language.portuguese,
                groupValue: _character,
                onChanged: (Language value) {
                  setState(() {
                    _character = value;
                    MyApp.of(context).setLocal(Locale('pt', 'MZ'));
                    Navigator.of(context, rootNavigator: true).pop();
                  });
                }),
          ),
        ],
      ),
    );
  }
}
