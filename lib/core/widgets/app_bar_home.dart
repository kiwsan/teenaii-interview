import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  AppBarHome() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(child: Text("Teenaii")),
      centerTitle: true,
      actions: <Widget>[
        Badge(
          position: BadgePosition.topEnd(top: 0, end: 3),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            "2",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              onPressed: () {}),
        )
        //Add more icon here
      ],
    );
  }
}
