import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleTextDisplay extends StatelessWidget {
  final String text;

  const TitleTextDisplay({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text, style: Theme.of(context).textTheme.headline1),
        InkWell(
          child: Text(
            'More',
            style: Theme.of(context).textTheme.headline4,
          ),
          onTap: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('A SnackBar has been shown.'),
              ),
            )
          },
        ),
      ],
    );
  }
}
