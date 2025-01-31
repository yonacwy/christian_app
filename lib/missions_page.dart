import 'package:flutter/material.dart';

class MissionsPage extends StatelessWidget {
  const MissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missions'),
      ),
      body: const Center(
        child: Text('Missions Page'),
      ),
    );
  }
}