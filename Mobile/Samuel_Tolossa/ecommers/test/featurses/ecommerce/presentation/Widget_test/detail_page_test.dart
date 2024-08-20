



import 'dart:io';

import 'package:ecommers/core/Icons/back_icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    HttpOverrides.global = null;
   
  });
  testWidgets(
    'test the ditail page of the product', 
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar:PreferredSize(
          preferredSize: const Size.fromHeight(286),
          child: Stack(
            key: const Key('DetailPageStack'),
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://via.placeholder.com/150'), fit: BoxFit.fill)),
              ),
              const BackIcons()
            ],
          ),
        ),
          )
        )
      );
      await tester.pumpAndSettle();
      
      expect(find.byKey(const Key('DetailPageStack')), findsOneWidget);

      expect(find.byType(Container), findsNWidgets(2));
      expect(find.byType(BackIcons), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    

      // expect(find.byType(DecoratedBox), findsOneWidget);
    }
  );

 

}