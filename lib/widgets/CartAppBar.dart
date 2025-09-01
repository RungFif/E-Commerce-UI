import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF4C53A5)),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: const [
          Icon(Icons.shopping_cart, color: Color(0xFF4C53A5)),
          SizedBox(width: 8),
          Text(
            'Cart',
            style: TextStyle(
              color: Color(0xFF4C53A5),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Color(0xFF4C53A5)),
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'Settings', child: Text('Settings')),
            const PopupMenuItem(value: 'Help', child: Text('Help')),
          ],
        ),
      ],
      shadowColor: Colors.black26,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
