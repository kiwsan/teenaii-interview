import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teenaii/core/util/http_status.dart';
import 'package:teenaii/core/widgets/bottom_loader.dart';
import 'package:teenaii/features/category/presentation/bloc/category_bloc.dart';
import 'package:teenaii/features/home/presentation/widgets/widgets.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        switch (state.status) {
          case CustomHttpStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case CustomHttpStatus.success:
            if (state.categories.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return SizedBox(
              height: 140,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.status == CustomHttpStatus.success
                    ? state.categories.length
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.categories.length
                      ? BottomLoader()
                      : Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 10),
                          child: CategoriesListItem(
                              category: state.categories[index]));
                },
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
