import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchControls extends StatefulWidget {
  @override
  _SearchControlsState createState() => _SearchControlsState();
}

class _SearchControlsState extends State<SearchControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xffEFEFEF), borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Text("Search", style: Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}
