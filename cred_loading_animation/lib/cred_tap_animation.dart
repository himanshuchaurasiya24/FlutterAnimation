import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CredAnimation extends StatefulWidget {
  @override
  _CredAnimationState createState() => _CredAnimationState();
}

class _CredAnimationState extends State<CredAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showTick = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _showTick = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: _showTick
              ? Lottie.asset('assets/lottie.json', repeat: false)
              : AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: SquarePainter(animationValue: _animation.value),
                      child: Container(
                        width: 200,
                        height: 200,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class SquarePainter extends CustomPainter {
  final double animationValue;

  SquarePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
    final double squareSize = size.width / 5;

    for (int i = 0; i < 4; i++) {
      paint.color = colors[i];
      final double offset = animationValue * 50 * (i + 1);
      canvas.drawRect(
        Rect.fromLTWH(
          (i % 2) * squareSize + offset,
          (i ~/ 2) * squareSize + offset,
          squareSize,
          squareSize,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
