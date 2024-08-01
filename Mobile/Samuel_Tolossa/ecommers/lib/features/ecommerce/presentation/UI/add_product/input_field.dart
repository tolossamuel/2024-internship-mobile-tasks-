

import 'package:flutter/material.dart';

import '../../../../../core/Colors/colors.dart';
import '../../../../../core/border/border_style.dart';

class InputField extends StatefulWidget {
  final String text;
  const InputField({
    super.key,
    required this.text,
    });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        hintText: widget.text,
        focusedBorder:widget.text != 'description'? borderStyle:largInputBOrderStyle,
        enabledBorder: widget.text != 'description'? borderStyle:largInputBOrderStyle,
        disabledBorder: widget.text != 'description'? borderStyle:largInputBOrderStyle,
        hintStyle: const TextStyle(
          
          color: smallText,
          fontSize: 14
        )
      ),
    );
  }
}