import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teenaii/core/widgets/app_bar_home.dart';
import 'package:teenaii/features/category/presentation/bloc/category_bloc.dart';
import 'package:teenaii/features/home/presentation/bloc/new_bloc.dart';
import 'package:teenaii/features/home/presentation/pages/news_list.dart';
import 'package:teenaii/features/home/presentation/pages/pages.dart';
import 'package:teenaii/features/home/presentation/widgets/widgets.dart';
import 'package:teenaii/features/post/presentation/bloc/post_bloc.dart';
import 'package:teenaii/injection_container.dart';

class HomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  HomePage({required this.title, this.onPush});
  final String title;
  final ValueChanged<int>? onPush;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewBloc _newBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarHome(),
        body: Stack(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 0),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => sl<NewBloc>()..add(NewFetched()),
                  ),
                  BlocProvider(
                    create: (_) => sl<CategoryBloc>()..add(CategoryFetched()),
                  ),
                  BlocProvider(
                    create: (_) => sl<PostBloc>()..add(PostFetched()),
                  ),
                ],
                child: SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: BlocBuilder<NewBloc, NewState>(
                          builder: (context, state) {
                            return NewList();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TitleTextDisplay(text: "Categories"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          return CategoriesList();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TitleTextDisplay(text: "Latest"),
                      ),
                      SizedBox(
                        height: 20,
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
              top: 20.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 70.0,
                child: SearchControls(),
              ))
        ]));
  }
}
