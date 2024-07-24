import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_mainscreen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose Your Favorite \nSnack",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Row(
                          children: [
                            Icon(
                              Icons.category,
                              color: Color.fromARGB(255, 40, 38, 38),
                            ),
                            SizedBox(width: 5),
                            Text('All categories'),
                          ],
                        ),
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 1),
                        onSelected: (bool value) {},
                      ),
                      const SizedBox(width: 10),
                      FilterChip(
                        label: const Text('Salty'),
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 1),
                        onSelected: (bool value) {},
                      ),
                      const SizedBox(width: 10),
                      FilterChip(
                        label: const Text('Sweet'),
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 1),
                        onSelected: (bool value) {},
                      ),
                      const SizedBox(width: 10),
                      FilterChip(
                        label: const Text('Drinks'),
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 1),
                        onSelected: (bool value) {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/Top Card.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Angi's Yummy Burger",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Delish vegan Burger \nthat tastes like heaven",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 211, 211, 211),
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "€ 13.99",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Colors.pink, Colors.blue],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.5),
                                          blurRadius: 10.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Add to order',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            top: 25,
                            right: 30,
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.pink),
                                SizedBox(width: 3),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -0,
                            right: 0,
                            child: Image.asset(
                              'assets/images/Burger_3D.png',
                              width: 175,
                              height: 175,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'We Recommend',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(4, (index) {
                      return const CardWidget(
                        title: "Mogli's Cup",
                        subtitle: 'Strawberry ice cream',
                        price: '€ 8.99',
                        likes: '200',
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
