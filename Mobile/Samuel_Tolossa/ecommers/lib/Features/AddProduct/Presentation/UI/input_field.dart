

import 'package:ecommers/core/Colors/colors.dart';
import 'package:ecommers/core/Text_Style/text_style.dart';
import 'package:ecommers/core/border/border_style.dart';
import 'package:flutter/material.dart';

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
        focusedBorder:widget.text != "description"? borderStyle:largInputBOrderStyle,
        enabledBorder: widget.text != "description"? borderStyle:largInputBOrderStyle,
        disabledBorder: widget.text != "description"? borderStyle:largInputBOrderStyle,
        hintStyle: const TextStyle(
          
          color: smallText,
          fontSize: 14
        )
      ),
    );
  }
}