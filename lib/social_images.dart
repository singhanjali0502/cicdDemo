import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/images.dart';

class SocalButtns extends StatelessWidget {
  const SocalButtns({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: Image.asset(ImageAssets.fb)),
        IconButton(onPressed: () {}, icon: Image.asset(ImageAssets.linkdin)),
        IconButton(onPressed: () {}, icon: Image.asset(ImageAssets.twitter)),
      ],
    );
  }
}
