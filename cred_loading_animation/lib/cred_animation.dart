import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CredLoadingAnimation extends StatelessWidget {
  const CredLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
