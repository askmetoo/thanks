import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thanks/core/i18n.dart';

class Index extends StatefulWidget {
  Widget bottomCardView() {
    DateTime date = DateTime.now();
    Widget dateWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 32, left: 32),
          child: Text(
            "${tr(DateFormat("EEEE").format(date))}",
            style: TextStyle(
              fontSize: 42,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4, left: 64),
          child: Text(
            "${DateFormat("d").format(date)} ${DateFormat("MMM").format(date)}",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
    return Column(
      children: <Widget>[
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(64),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 32, left: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromARGB(255, 115, 75, 245),
                    Color.fromARGB(255, 185, 90, 250),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  dateWidget,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() => IndexState();

  SliverAppBar sliverAppBar({bool innerBoxIsScrolled, List<Widget> actions}) {
    return SliverAppBar(
      elevation: 0,
      forceElevated: innerBoxIsScrolled,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      expandedHeight: 200,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: Text(
          "Thanks",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Potra",
            fontSize: 26,
          ),
        ),
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
                  ),
                ),
              ),
            ];
          },
          body: widget.bottomCardView(),
        ),
      ),
    );
  }
}
