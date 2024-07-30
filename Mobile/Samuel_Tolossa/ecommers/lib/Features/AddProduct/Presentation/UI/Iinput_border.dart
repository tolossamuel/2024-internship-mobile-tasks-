

import 'package:flutter/material.dart';

class IinputBorder extends StatelessWidget {
  final int hight;
  final bool check;
  const IinputBorder({
    super.key,
    required this.hight,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 366,
              height: hight.toDouble(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(200, 238, 238, 238)
              ),
              child: Center(
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            // Conditionally add widgets based on the 'check' variable
                  if (check) ...[
                      const Icon(Icons.add_photo_alternate_outlined),
                      const SizedBox(height: 15),
                      const Text("upload image"),
                    ] 
                  ],
                ),
              ),
            );
  }
}