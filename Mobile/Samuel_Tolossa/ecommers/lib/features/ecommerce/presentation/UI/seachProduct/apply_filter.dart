

import 'package:flutter/material.dart';

import '../../../../../core/Colors/colors.dart';

class ApplyFilter extends StatelessWidget {

  const ApplyFilter({
    super.key,
    
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 366,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color : mainColor,
                border: const Border(
                  top: BorderSide(color: mainColor),
                  left: BorderSide(color: mainColor),
                  right: BorderSide(color: mainColor),
                  bottom: BorderSide(color: mainColor),
                
                )
              ),
              child: const Center(
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            // Conditionally add widgets based on the 'check' variable
                      
                        Text('Apply',style: TextStyle(color: Colors.white),),
                  ]
                       
                ),
              ),
            );
  }
}