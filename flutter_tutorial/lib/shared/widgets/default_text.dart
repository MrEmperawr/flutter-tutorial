import 'package:flutter/material.dart';
import 'package:flutter_tutorial/config/theme.dart';

class DefaultText extends StatelessWidget {
  final String data;
  final TextStyle style;
  const DefaultText(
    this.data, {
    Key? key,
    this.style = textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style);
  }
}
