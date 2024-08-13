

import 'package:flutter/material.dart';

import '../../../../../core/Colors/colors.dart';
import '../../../../../core/border/border_style.dart';

class InputField extends StatelessWidget {
  final String text;
  final String disc;
  final String placeHolder;
 
  const InputField({
    super.key,
    required this.text,
    this.disc = '',
    required this.placeHolder,

    });

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: TextFormField(
    
        scribbleEnabled: true,
        scrollPhysics: const BouncingScrollPhysics(),
        maxLines: null,
       
        initialValue: placeHolder,
        decoration: InputDecoration(
          
          hintText: disc,
          focusedBorder:text != 'description'? borderStyle:largInputBOrderStyle,
          enabledBorder: text != 'description'? borderStyle:largInputBOrderStyle,
          disabledBorder: text != 'description'? borderStyle:largInputBOrderStyle,
          hintStyle: const TextStyle(
            
            color: smallText,
            fontSize: 14
          )
        ),
      ),
    );
  }
}