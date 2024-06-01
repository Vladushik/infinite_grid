import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
