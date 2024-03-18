import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerQuestion extends StatelessWidget {
  const ShimmerQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [0, 1, 2]
                .map((e) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      margin: EdgeInsets.only(bottom: e != 2 ? 7 : 0),
                      color: Colors.white,
                      height: 20.0,
                      width: MediaQuery.of(context).size.width,
                    )))
                .toList(growable: false),
          ),
        ),
        ...[0, 1, 2, 3, 4].map(
          (answer) => ListTile(
            leading: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Text((answer + 1).toString()),
              ),
            ),
            title: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                color: Colors.white,
                height: 10.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        )
      ],
    );
  }
}
