
import 'package:flutter/material.dart';

class DeleteUpdateButton extends StatelessWidget {
  final String text;
  final Color bottonColor;
  final Color bordColor;
  const DeleteUpdateButton({
    super.key,
    required this.text,
    required this.bottonColor,
    required this.bordColor
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color : bottonColor,
                border: Border(
                  top: BorderSide(color: bordColor),
                  left: BorderSide(color: bordColor),
                  right: BorderSide(color: bordColor),
                  bottom: BorderSide(color: bordColor),
                
                )
              ),
              child:  Center(
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            // Conditionally add widgets based on the 'check' variable
                        
                        Text(text,style: TextStyle(color: text == 'DELETE'? Colors.red:Colors.white),),
                        
                  ],
                ),
              ),
            );
  }
}