import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextOverflow overflow;
  final TextAlign align;
  final int maxLine;

  const TextView({
    super.key,
    required this.data,
    required this.style,
    this.maxLine = 1,
    this.align = TextAlign.center,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}
