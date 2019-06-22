import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thanks/core/i18n.dart';
import 'package:thanks/view/color_scheme.dart';

class Index extends StatefulWidget {
  Widget dateWidget() {
    DateTime date = DateTime.now();
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 4, left: 32),
          child: Text(
            "${DateFormat("d").format(date)} ${DateFormat("MMM").format(date)}",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 32, left: 64),
          child: Text(
            "${tr(DateFormat("EEEE").format(date))}",
            style: TextStyle(
              fontSize: 46,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() => IndexState();

  SliverAppBar sliverAppBar(
      {bool innerBoxIsScrolled, List<Widget> actions, BuildContext context}) {
    return SliverAppBar(
      elevation: 0,
      forceElevated: innerBoxIsScrolled,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      expandedHeight: MediaQuery.of(context).size.height / 2 - 32,
      floating: true,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.biggest.height <= 144)
              ? Opacity(
                  opacity: 1 - constraints.biggest.height/144,
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title: Text(
                      "Thanks",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Krabuler",
                      ),
                    ),
                  ),
                )
              : Opacity(
                  opacity: constraints.biggest.height < 196
                      ? 1 - 144 / constraints.biggest.height
                      : 1,
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: constraints.biggest.height / 2 - 16),
                        Text(
                          "Good evening,",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 8, right: 32),
                          child: Text(
                            "Donghyeok Tak",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
      actions: actions,
    );
  }
}

class IndexState extends State<Index> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverSafeArea(
                  sliver: widget.sliverAppBar(
                      innerBoxIsScrolled: innerBoxIsScrolled,
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Color.fromARGB(255, 36, 39, 52),
                          ),
                          onPressed: () {},
                        ),
                        Spacer(),
                      ],
                      context: context),
                ),
              ),
            ];
          },
          body: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(69),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 32, left: 8, right: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: theme.primaryGradient
                        /*<Color>[
                          Color.fromARGB(255, 105, 75, 255),
                          Color.fromARGB(255, 185, 90, 250),
                        ]*/
                        ,
                      ),
                    ),
                    child: ListView(
                      padding: EdgeInsets.only(top: 32),
                      children: <Widget>[
                        widget.dateWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
