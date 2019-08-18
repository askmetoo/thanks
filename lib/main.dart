import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanks/pages/index.dart';
import 'package:thanks/styles/default.dart';

class Application extends StatelessWidget {
  Application() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Ubuntu",
      ),
      title: "All that Thanks",
      home: Index(),
    );
  }
}

void main() => (Application app) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("theme")) {
        selectedTheme=ColorSchemes.values.firstWhere(
              (e) => e.toString() == "${prefs.getString("theme")}",
          orElse: () => null,
        );
      }

      runApp(app);
    }(Application());
