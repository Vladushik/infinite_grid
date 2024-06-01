import 'package:flutter/material.dart';
import 'package:infinite_grid/src/core/resources/app_images.dart';
import 'package:infinite_grid/src/core/widgets/wrappers/svg_wrapper_widget.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 375,
        maxHeight: 100,
      ),
      child: const SvgWrapperWidget(
        path: AppImages.logo,
        width: 375,
      ),
    );
  }
}

class LogoWithBorderWidget extends StatelessWidget {
  const LogoWithBorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      constraints: const BoxConstraints(
        maxWidth: 375,
        maxHeight: 100,
        minHeight: 100,
      ),
      child: const SvgWrapperWidget(
        path: AppImages.logo,
        width: double.infinity,
      ),
    );
  }
}
