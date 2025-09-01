import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: const Color(0xFF4C53A5),
      ),
      body: Center(
        child: Text('Halaman Akun'),
      ), // Akan diupdate dengan UI lengkap
    );
  }
}
