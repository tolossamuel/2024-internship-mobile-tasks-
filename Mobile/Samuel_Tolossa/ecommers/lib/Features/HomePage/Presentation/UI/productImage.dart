import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index){
      return  GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, "/detail")
        },
        child: Column(
          children: [
            Container(
              height: 224,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 189, 187, 187),
                      offset: Offset(0, 1),
                      spreadRadius: 1,
                    )
                  ]),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/image/shoe.png",
                    ),
                  ),
            
                  // about products ==========================================
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 15, 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deby Leather Shoes",
                              style:
                                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Men's shoe"),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$120"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 250, 235, 102),
                                  size: 20,
                                ),
                                Text(
                                  "(4.0)",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      );}
    );
  }
}
