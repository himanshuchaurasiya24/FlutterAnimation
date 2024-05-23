import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isClicked = !_isClicked;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 60.0,
            width: _isClicked ? 200 : 60.0,
            decoration: BoxDecoration(
              color: _isClicked ? Colors.greenAccent : Colors.blue,
              borderRadius: BorderRadius.circular(_isClicked ? 30 : 5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isClicked
                    ? const Icon(
                        Icons.check,
                      )
                    : const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                if (_isClicked) const Text('Added To Cart')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
