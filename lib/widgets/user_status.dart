import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:christian_app/home/login_page.dart';

class UserStatus extends StatelessWidget {
  const UserStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box('user');
    final userName = userBox.get('name') ?? 'Guest';

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Logged in as: $userName'),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            userBox.clear();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}