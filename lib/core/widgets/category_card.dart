import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teenaii/features/category/domain/entities/entities.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: "${category.imageUrl!.thumbnail}",
            fit: BoxFit.cover,
            width: 140.w,
            height: 70.h),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text("${category.name}", style: Theme.of(context).textTheme.bodyText2),
    ]);
  }
}
