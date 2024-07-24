import 'dart:ui';

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 247, 119, 170),
                  Color.fromARGB(255, 53, 4, 80),
                ],
                begin: Alignment.center,
                end: Alignment.topCenter,
              ),
            ),
          ),
          const StrokedText(
            text: 'SNACK',
            textStyle: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(159, 131, 23, 148)),
            strokeStyle: TextStyle(
              fontSize: 120,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
            top: 40,
            left: -10,
          ),
          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: GradientWavePainter(),
          ),
          Positioned(
            top: -40,
            left: (MediaQuery.of(context).size.width - 500) / 0.75,
            child: Image.asset(
              'assets/images/chick cupcakes_3D.png',
              width: 800,
              height: 800,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25.0,
                  sigmaY: 25.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 225,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromARGB(54, 255, 255, 255),
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Feeling Snackish Today?',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Explore Angi's most popular snack selection and get instantly happy.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Positioned(
                          top: 100,
                          left: 50,
                          child: GlowButton(
                            onPressed: () {},
                            child: const Text(
                              'Order Now',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint gradientPaint = Paint()
      ..shader = const LinearGradient(colors: [
        Color.fromARGB(94, 2, 108, 105),
        Color.fromARGB(255, 30, 47, 62),
        Color.fromARGB(232, 10, 123, 189),
      ], begin: Alignment.bottomCenter, end: Alignment.center)
          .createShader(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
      )
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, size.height * 0.075);

    path.quadraticBezierTo(size.width * 0.15, size.height * 0.07,
        size.width * 0.2, size.height * 0.135);

    path.quadraticBezierTo(size.width * 0.4, size.height * 0.35,
        size.width * 0.7, size.height * 0.2);

    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.15, size.width, size.height * 0.2);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class StrokedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextStyle strokeStyle;
  final double top;
  final double left;

  const StrokedText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.strokeStyle,
    this.top = 0,
    this.left = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Stack(
        children: [
          Text(
            text,
            style: strokeStyle,
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class GlowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const GlowButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 248, 56, 210).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 100,
            offset: const Offset(0, 50), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 199, 87, 169),
          padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
