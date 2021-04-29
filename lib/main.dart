import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thedemo_flutter/Home/homePage.dart';
import 'package:thedemo_flutter/Home/splashScreen.dart';
import 'package:thedemo_flutter/Settings/app_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  static Locale local = Locale('en', 'ZA');

  setLocal(Locale value) {
    setState(() {
      local = value;
    });
  }

  getLocale() {
    return Locale myLocale = local;
  }

  @override
  Widget build(BuildContext context) {
    // This widget is the root of your application.
    return AdaptiveTheme(
      light: ThemeData(
        // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. 
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: Color(0xff04346c),
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Color(0xff04346c),
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          accentColor: Colors.lightBlue,
          backgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: Color(0xff04346c))),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        supportedLocales: [
          Locale('en', "ZA"),
          Locale('pt', "MZ"),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        locale: local,
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: new SplashScreen(),
        routes: {
          HomePage.routeNme: (ctx) => HomePage(),
        },
      ),
    );
  }
}
