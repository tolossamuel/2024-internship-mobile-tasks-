import 'package:flutter/material.dart';

import '../../../../../core/Colors/colors.dart';
import '../../../../../core/Text_Style/text_style.dart';

class HeaderPart extends StatelessWidget {
  const HeaderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 201, 201),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: TextStyles(text: 'July 14, 2023',fontColor: smallText,fontSizes: 10),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                TextStyles(text: 'Hello, ',fontColor: mainText,fontSizes: 16,fontWeight: FontWeight.w300,),
                                TextStyles(text: 'Samuel',fontColor: mainText,fontSizes: 16,fontWeight: FontWeight.bold,),
                                
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                     
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 248, 247, 247),
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          
                        )
                        
                      ),
                      child: const Icon(Icons.notifications_none_sharp,),
                    )
                  ],
                ),
              );

  }
}