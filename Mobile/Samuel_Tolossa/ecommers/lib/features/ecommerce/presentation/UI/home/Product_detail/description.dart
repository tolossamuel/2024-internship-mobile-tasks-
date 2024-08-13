

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String text;
  const Description({
    super.key,
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text
    );
  }
}