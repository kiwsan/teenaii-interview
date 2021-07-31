import 'package:flutter/material.dart';
import 'package:teenaii/core/widgets/post_card.dart';
import 'package:teenaii/features/post/domain/entities/entities.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return PostCard(post: post);
  }
}
