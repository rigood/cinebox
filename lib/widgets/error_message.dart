import 'package:flutter/material.dart';
import 'package:cinebox/constants/themes.dart';
import 'package:cinebox/constants/sizes.dart';
import 'package:cinebox/constants/gaps.dart';

class ErrorMessage extends StatelessWidget {
  final String text;
  final double padding;

  const ErrorMessage({
    super.key,
    required this.text,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width - 2 * padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: Sizes.size48,
              color: ColorThemes.primary,
            ),
            Gaps.v10,
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: Sizes.size14,
                color: ColorThemes.primary,
              ),
            ),
            Gaps.v3,
            const Text(
              "잠시 후 다시 시도해주세요.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.size14,
                color: ColorThemes.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
