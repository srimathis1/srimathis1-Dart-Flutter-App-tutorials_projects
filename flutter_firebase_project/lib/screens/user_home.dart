import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => AuthService().logout(),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome User 👋',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
