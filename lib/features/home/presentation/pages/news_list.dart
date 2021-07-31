import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teenaii/core/util/http_status.dart';
import 'package:teenaii/features/home/presentation/bloc/new_bloc.dart';
import 'package:teenaii/features/home/presentation/widgets/widgets.dart';

class NewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBloc, NewState>(
      builder: (context, state) {
        switch (state.status) {
          case CustomHttpStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case CustomHttpStatus.success:
            if (state.news.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return BannerCarouselDisplay(news: state.news);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
