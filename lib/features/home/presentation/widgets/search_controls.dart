import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchControls extends StatefulWidget {
  @override
  _SearchControlsState createState() => _SearchControlsState();
}

class _SearchControlsState extends State<SearchControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      height: 30.h,
      decoration: BoxDecoration(
          color: Color(0xffEFEFEF), borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          SizedBox(
            width: 15.w,
          ),
          Text("Search", style: Theme.of(context).textTheme.headline5),
        ],
      ),
    );
  }
}
