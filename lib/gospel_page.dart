import 'package:flutter/material.dart';

class GospelPage extends StatelessWidget {
  const GospelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gospel'),
      ),
      body: const Center(
        child: Text('Gospel Page'),
      ),
    );
  }
}