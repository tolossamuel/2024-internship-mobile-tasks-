import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/product_bloc/product_bloc.dart';
import '../../../state/product_bloc/product_event.dart';
import '../../../state/product_bloc/product_state.dart';

class DeleteUpdateButton extends StatelessWidget {
  final String text;
  final Color bottonColor;
  final Color bordColor;
  final String imageUrl;
  final String name;
  final double price;
  final String disc;
  final String id;
  const DeleteUpdateButton(
      {super.key,
      required this.text,
      required this.bottonColor,
      required this.bordColor,
      required this.id,
      this.imageUrl = '',
      this.name = '',
      this.price = 0,
      this.disc = ''});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.messages),
            ),
          );
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: text != 'DELETE'
                ? () {
                    Navigator.pushNamed(
                      context,
                      '/add-product',
                      arguments: {
                        'imageUrl': imageUrl,
                        'price': price,
                        'name': name,
                        'disc': disc,
                        'id': id,
                      },
                    );
                  }
                : () {
                    context.read<ProductBloc>().add(DeleteProductEvent(id: id));
                    if (state is SuccessDelete) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product Deleted'),
                        ),
                      );
                      context.read<ProductBloc>().add(const LoadAllProductEvent());
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    }
                  },
            child: Container(
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bottonColor,
                  border: Border(
                    top: BorderSide(color: bordColor),
                    left: BorderSide(color: bordColor),
                    right: BorderSide(color: bordColor),
                    bottom: BorderSide(color: bordColor),
                  )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Conditionally add widgets based on the 'check' variable

                    Text(
                      text,
                      style: TextStyle(
                          color: text == 'DELETE' ? Colors.red : Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
