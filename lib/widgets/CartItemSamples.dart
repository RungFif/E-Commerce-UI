import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  final List<bool> _visible = List.generate(4, (index) => true);
  final List<int> _quantity = List.generate(4, (index) => 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        if (!_visible[index]) return const SizedBox.shrink();
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.grey[200],
                  width: 70,
                  height: 70,
                  child: const Icon(
                    Icons.image,
                    size: 40,
                    color: Color(0xFF4C53A5),
                  ), // Ganti dengan Image.asset jika sudah ada gambar
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Produk ${index + 1}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Rp 300.000',
                      style: TextStyle(fontSize: 16, color: Color(0xFF4C53A5)),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _visible[index] = false;
                  });
                },
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Color(0xFF4C53A5),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_quantity[index] > 1) _quantity[index]--;
                      });
                    },
                  ),
                  Text(
                    _quantity[index].toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Color(0xFF4C53A5),
                    ),
                    onPressed: () {
                      setState(() {
                        _quantity[index]++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
