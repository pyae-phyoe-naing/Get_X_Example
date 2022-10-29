import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class PostDetailShimmer extends StatelessWidget {
  const PostDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              height: 50,
              color: Colors.grey,
            )),
        const SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              height: 80,
              color: Colors.grey,
            )),
        const SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              height: 150,
              color: Colors.grey,
            ))
      ],
    );
  }
}
