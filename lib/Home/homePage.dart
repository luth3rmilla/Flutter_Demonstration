import 'package:flutter/material.dart';
import 'package:thedemo_flutter/Settings/app_localizations.dart';
import 'package:thedemo_flutter/Settings/settings.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  static const routeNme = '/homePage';

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('1_string'),
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context).translate('10_string'),
            tooltip: AppLocalizations.of(context).translate('11_string'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context).translate('12_string'),
            tooltip: AppLocalizations.of(context).translate('13_string'),
          )
        ],
      ),
      body: getBodyWidget(),
    );
  }

  getBodyWidget() {
    switch (_currentIndex) {
      case 0:
        return (_currentIndex == 0) ? Home() : Container();
      case 1:
        return (_currentIndex == 1) ? Settings() : Container();
    }
  }
}
