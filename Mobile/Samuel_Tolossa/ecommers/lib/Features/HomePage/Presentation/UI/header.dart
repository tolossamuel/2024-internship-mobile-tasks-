import 'package:flutter/material.dart';

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
                    const SizedBox(
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text("July 14, 2023"),
                          ),
                          SizedBox(
                            child: Text("Hello,Yohannes"),
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
                      child: const Icon(Icons.notifications_none_sharp),
                    )
                  ],
                ),
              );

  }
}