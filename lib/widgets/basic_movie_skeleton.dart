import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BasicMovieSkeleton extends StatelessWidget {
  const BasicMovieSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 200,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(8, 7, 28, 0.1),
              blurRadius: 10.0,
              offset: Offset(0, 8),
            )
          ],
        ),
      ),
    );
  }
}
