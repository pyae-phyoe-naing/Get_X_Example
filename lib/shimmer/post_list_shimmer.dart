import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class PostListShimmer extends StatelessWidget {
  const PostListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      for (var i = 0; i < 15; i++)
        Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 197, 196, 196),
            highlightColor: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              color: const Color.fromARGB(255, 197, 196, 196),
            ))
    ]);
  }
}
