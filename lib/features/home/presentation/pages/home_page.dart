import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teenaii/core/widgets/app_bar_home.dart';
import 'package:teenaii/features/category/presentation/bloc/category_bloc.dart';
import 'package:teenaii/features/home/presentation/bloc/new_bloc.dart';
import 'package:teenaii/features/home/presentation/pages/news_list.dart';
import 'package:teenaii/features/home/presentation/pages/pages.dart';
import 'package:teenaii/features/home/presentation/widgets/widgets.dart';
import 'package:teenaii/features/post/presentation/bloc/post_bloc.dart';
import 'package:teenaii/injection_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewBloc _newBloc;
  late CategoryBloc _categoryBloc;
  late PostBloc _postBloc;

  @override
  void initState() {
    super.initState();

    _newBloc = sl<NewBloc>();
    _categoryBloc = sl<CategoryBloc>();
    _postBloc = sl<PostBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _newBloc.close();
    _categoryBloc.close();
    _postBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarHome(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home_outlined),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.health_and_safety_rounded),
              label: 'จ้างงาน',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.hdr_plus), label: 'โพสต์งาน'),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_outlined), label: 'โปรไฟล์')
          ],
        ),
        body: Stack(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  top: 0.r, bottom: 5.r, left: 20.r, right: 0.r),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => _newBloc..add(NewFetched())),
                  BlocProvider(
                      create: (_) => _categoryBloc..add(CategoryFetched())),
                  BlocProvider(create: (_) => _postBloc..add(PostFetched())),
                ],
                child: SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.only(top: 90.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.r),
                        child: BlocBuilder<NewBloc, NewState>(
                          builder: (context, state) {
                            return NewList();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.r),
                        child: TitleTextDisplay(text: "Categories"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          return CategoriesList();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.r),
                        child: TitleTextDisplay(text: "Latest"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocBuilder<PostBloc, PostState>(
                        builder: (context, state) {
                          return PostsList();
                        },
                      ),
                    ],
                  ),
                )),
              )),
          Positioned(
              top: 10.sp,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
                width: MediaQuery.of(context).size.width,
                height: 70.r,
                child: SearchControls(),
              ))
        ]));
  }
}
