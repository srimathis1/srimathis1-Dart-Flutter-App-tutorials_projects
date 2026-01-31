import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'admin_home.dart';
import 'user_home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // NOT LOGGED IN
        if (!snapshot.hasData) {
          return const LoginScreen();
        }

        // LOGGED IN → CHECK ROLE
        return FutureBuilder<String>(
          future:
              AuthService().getUserRole(snapshot.data!.uid),
          builder: (context, roleSnap) {
            if (!roleSnap.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            return roleSnap.data == 'admin'
                ? const AdminHome()
                : const UserHome();
          },
        );
      },
    );
  }
}
