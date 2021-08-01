import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:teenaii/features/home/domain/entities/new_entity.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCarouselDisplay extends StatelessWidget {
  const BannerCarouselDisplay({Key? key, required this.news}) : super(key: key);

  final List<NewEntity> news;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        height: 100.h,
        child: CarouselSlider.builder(
            unlimitedMode: true,
            enableAutoSlider: true,
            slideBuilder: (index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: "${news[index].imageUrl}",
                  width: double.maxFinite,
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
              );
            },
            slideTransform: CubeTransform(),
            slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 18.r),
            ),
            itemCount: news.length));
  }
}
