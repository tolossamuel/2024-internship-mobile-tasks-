import 'dart:io';
import 'package:ecommers/core/Colors/colors.dart';
import 'package:ecommers/core/utility/loading_page.dart';
import 'package:ecommers/features/ecommerce/Domain/entity/ecommerce_entity.dart';
import 'package:ecommers/features/ecommerce/presentation/UI/home/product_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {
  
  setUp(() {
    HttpOverrides.global = null;
   
  });
  testWidgets('test the home page of the app', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final product = const EcommerceEntity(
        id: '12341',
        name: 'Product 1',
        description: 'Product 1 description',
        imageUrl: 'https://via.placeholder.com/150',
        price: 123);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
              children: [
                ProductImage(
                  imageUrl: product.imageUrl,
                  price: product.price,
                  disc: product.description,
                  title: product.name,
                  id: product.id,
                ),
              ],
            )),
      ),
    );
    await tester.pumpAndSettle();
    // Verify that our counter starts at 0.
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 1 description'), findsOneWidget);
    // expect(find.text('100'), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.text('(4.0)'), findsOneWidget);
    expect(find.text('\$123.0'), findsOneWidget);
    expect(find.byType(ProductImage), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('test list of product widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final products = [
      const EcommerceEntity(
          id: '12341',
          name: 'Product 1',
          description: 'Product 1 description',
          imageUrl: 'https://via.placeholder.com/150',
          price: 123),
      const EcommerceEntity(
          id: '12341',
          name: 'Product 2',
          description: 'Product 2 description',
          imageUrl: 'https://via.placeholder.com/150',
          price: 124),
      const EcommerceEntity(
          id: '12341',
          name: 'Product 3',
          description: 'Product 3 description',
          imageUrl: 'https://via.placeholder.com/150',
          price: 125)
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductImage(
                        imageUrl: product.imageUrl,
                        price: product.price,
                        disc: product.description,
                        title: product.name,
                        id: product.id,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    // Verify that our counter starts at 0.
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 1 description'), findsOneWidget);
    // expect(find.text('100'), findsOneWidget);
    expect(find.byType(Icon), findsNWidgets(3));
    expect(find.text('(4.0)'), findsNWidgets(3));
    expect(find.text('\$123.0'), findsOneWidget);
    expect(find.text('\$124.0'), findsOneWidget);
    expect(find.text('\$125.0'), findsOneWidget);
    expect(find.byType(ProductImage), findsNWidgets(3));
    expect(find.byType(Image), findsNWidgets(6));
  });

  testWidgets('test loading page widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const LoadingPage();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
    // await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    expect(find.byType(LoadingPage), findsNWidgets(3));
    expect(find.byType(Container), findsNWidgets(12));
  });

  testWidgets('test the widget on error', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children: [
            const Text('try again'),
            ElevatedButton(
              onPressed: () => {},
              child: const Icon(Icons.refresh),
            )
          ]),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text('try again'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
  });



  testWidgets(
    'test the floating button', 
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            floatingActionButton: GestureDetector(
          onTap: () {
          //   Navigator.pushNamed(context, '/add-product',
          // arguments: {'id':'','imageUrl':'','price':0,'name':'','disc':'','type':0},);
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: mainColor,
            ),
            child: const Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(MaterialApp), findsOneWidget);
    },
  );
  
}
