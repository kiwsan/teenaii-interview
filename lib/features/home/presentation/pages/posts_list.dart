import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teenaii/core/util/http_status.dart';
import 'package:teenaii/core/widgets/bottom_loader.dart';
import 'package:teenaii/features/home/presentation/widgets/post_list_item.dart';
import 'package:teenaii/features/post/presentation/bloc/post_bloc.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case CustomHttpStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case CustomHttpStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return SizedBox(
              height: 280,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.status == CustomHttpStatus.success
                    ? state.posts.length
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 10),
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
