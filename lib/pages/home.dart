import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanks/components/question.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences prefs;

  bool showQuestion() {
    final DateTime _now = DateTime.now();
    List<String> latestDate = prefs.getStringList("latestDate");
    if (latestDate == null) return true;
    return (latestDate[1] != _now.day.toString()) |
            (latestDate[0] != _now.year.toString())
        ? true
        : false;
  }

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  Future<Null> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: SafeArea(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: EdgeInsets.all(32),
                child: () {
                  switch (i) {
                    case 0:
                      if (showQuestion()) return Question();
                      continue _;
                    _:
                    default:
                      return Text(i.toString());
                  }
                  return null;
                }(),
              );
            },
          ),
        ),
      );
}
