import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teenaii/core/util/custom_enums.dart';
import 'package:teenaii/core/widgets/bottom_loader.dart';
import 'package:teenaii/features/home/presentation/widgets/post_list_item.dart';
import 'package:teenaii/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case CustomResponseStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case CustomResponseStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return SizedBox(
              height: 280.h,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.status == CustomResponseStatus.success
                    ? state.posts.length
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : Padding(
                          padding: EdgeInsets.fromLTRB(0.r, 0.r, 8.r, 10.r),
                          child: PostListItem(post: state.posts[index]));
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
