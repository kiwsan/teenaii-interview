import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teenaii/features/post/domain/entities/post_entity.dart';
import 'package:transparent_image/transparent_image.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: "${post.imageUrl}",
              width: 180,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${post.title}",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text("from",
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      NetworkImage("${post.userImage}"),
                                  backgroundColor: Colors.transparent,
                                )),
                            SizedBox(width: 10),
                            Text("${post.userName}",
                                style: Theme.of(context).textTheme.bodyText2)
                          ],
                        ),
                        Text("${post.price} ฿",
                            style: Theme.of(context).textTheme.bodyText1)
                      ])),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                        Text("${post.address!.province}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(child: Icon(Icons.location_pin)),
                            SizedBox(width: 5),
                            Text("${post.distance}",
                                style: Theme.of(context).textTheme.bodyText2)
                          ],
                        ),
                      ]))
                ],
              )),
        ],
      ),
    );
  }
}
