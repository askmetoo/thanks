import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thanks/components/animation/show_up.dart';
import 'package:thanks/generated/i18n.dart';
import 'package:thanks/models/structure.dart';
import 'package:thanks/pages/new.dart';
import 'package:thanks/styles/colors.dart';

class Question extends StatelessWidget {
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DateFormat(
                S.of(context).titleDateFormat(
                  () {
                    switch (DateFormat("EEEE").format(now)) {
                      case "Monday":
                        return S.of(context).Monday;
                      case "Tuesday":
                        return S.of(context).Tuesday;
                      case "Wednesday":
                        return S.of(context).Wednesday;
                      case "Thursday":
                        return S.of(context).Thursday;
                      case "Friday":
                        return S.of(context).Friday;
                      case "Saturday":
                        return S.of(context).Saturday;
                      case "Sunday":
                        return S.of(context).Sunday;
                      default:
                        return "Unknown Date";
                    }
                  }(),
                ),
              ).format(now),
              style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox(height: 16),
            ShowUp(
              animatedOpacity: true,
              child: Text(
                S.of(context).howWasYourDay,
                style: Theme.of(context).textTheme.headline,
              ),
              begin: Offset.zero,
              delay: Duration(milliseconds: 500),
              duration: Duration(milliseconds: 500),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 8),
                ShowUp(
                  child: _buildButton(
                    context,
                    S.of(context).feelingGreat,
                    Feelings.great,
                  ),
                  animatedOpacity: true,
                  delay: Duration(milliseconds: 100),
                  duration: Duration(milliseconds: 200),
                  begin: Offset(0, .25),
                  curve: Curves.linearToEaseOut,
                ),
                SizedBox(height: 8),
                ShowUp(
                  child: _buildButton(
                    context,
                    S.of(context).feelingNotGood,
                    Feelings.notGood,
                  ),
                  animatedOpacity: true,
                  delay: Duration(milliseconds: 200),
                  duration: Duration(milliseconds: 300),
                  begin: Offset(0, .50),
                  curve: Curves.linearToEaseOut,
                ),
                SizedBox(height: 8),
                ShowUp(
                  child: _buildButton(
                    context,
                    S.of(context).feelingSad,
                    Feelings.sad,
                  ),
                  animatedOpacity: true,
                  delay: Duration(milliseconds: 300),
                  duration: Duration(milliseconds: 400),
                  begin: Offset(0, .75),
                  curve: Curves.linearToEaseOut,
                ),
                SizedBox(height: 8),
                ShowUp(
                  child: _buildButton(
                    context,
                    S.of(context).feelingAngry,
                    Feelings.angry,
                  ),
                  animatedOpacity: true,
                  delay: Duration(milliseconds: 400),
                  duration: Duration(milliseconds: 500),
                  begin: Offset(0, 1),
                  curve: Curves.linearToEaseOut,
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildButton(BuildContext context, String content, Feelings feeling) =>
      FlatButton(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            content,
            style: Theme.of(context).textTheme.button.copyWith(
                  color: DefaultColorTheme.main,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => NewJournalPage(
                feeling: feeling,
              ),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: DefaultColorTheme.main, width: 0.75),
        ),
      );
}