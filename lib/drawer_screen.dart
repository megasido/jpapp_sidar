import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Screen'),
      ),
      body: const Center(
        child: Text('Detail Screen'),
      ),
    );
  }
}
