import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: const Color(0xFF4C53A5),
      ),
      body: Center(
        child: Text('Halaman Ganti Password'),
      ), // Akan diupdate dengan UI lengkap
    );
  }
}
