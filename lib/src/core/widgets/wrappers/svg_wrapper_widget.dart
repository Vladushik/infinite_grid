import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWrapperWidget extends StatelessWidget {
  const SvgWrapperWidget({
    required this.path,
    this.width,
    super.key,
  });

  final String path;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
    );
  }
}
