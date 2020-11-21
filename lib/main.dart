import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading.dart';
import 'package:flutter_app/screens/feedParser.dart';
import 'package:flutter_app/screens/settings.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'services/httpService/config.dart';
import 'tabs/first.dart';
import 'tabs/second.dart';
import 'tabs/third.dart';
import 'screens/account.dart';
import 'screens/home.dart';
import 'screens/settings.dart';
import 'app.dart';
import 'search.dart';
import './common/web_view.dart';
import 'pages/demo_page.dart';
import 'pages/refresh_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Using tabs',
    theme: mDefaultTheme,
    // home: new RefreshPage(),
    // home: new LoadingPage(),
    home: HomeScreen(),
    // ignore: missing_return
    onGenerateRoute: (settings) {
      // If you push the PassArguments route
      if (settings.name == FeedParserScreen.routeName) {
        // Cast the arguments to the correct type: ScreenArguments.
        final id = settings.arguments;

        // Then, extract the required data from the arguments and
        // pass the data to the correct screen.
        return MaterialPageRoute(
          builder: (context) {
            return FeedParserScreen(arguments: id);
          },
        );
      }
    },
    routes: <String, WidgetBuilder>{
      "app": (BuildContext context) => new App(),
      "search": (BuildContext context) => new Search(),
      // define the routes
      SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => AccountScreen(),
      FeedParserScreen.routeName: (BuildContext context, {arguments}) => FeedParserScreen(arguments: arguments),
      WebviewScreen.routeName: (BuildContext context, {arguments}) => WebviewScreen(arguments: arguments),
    },
  ));
}

final ThemeData mDefaultTheme = new ThemeData(
    primaryColor: Color(0xff303030),
    scaffoldBackgroundColor: Color(0xffebebeb),
    cardColor: Color(0xff393a3f));
