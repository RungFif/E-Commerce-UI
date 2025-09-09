import 'package:flutter/material.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/CategoriesWidget.dart';
import '../widgets/ItemsWidget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: const Color(0xFFF5F6FA),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: [
          _buildHomePageContent(),
          Container(
            color: Colors.white,
            child: Center(child: Text('Cart Page')),
          ),
          Container(
            color: Colors.white,
            child: Center(child: Text('Account Page')),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        backgroundColor: const Color(0xFFF5F6FA),
        color: const Color(0xFF4C53A5),
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.home,
            color: _pageIndex == 0 ? Colors.amber : Colors.white,
          ),
          Stack(
            children: [
              Icon(
                Icons.shopping_cart,
                color: _pageIndex == 1 ? Colors.amber : Colors.white,
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          Icon(
            Icons.person,
            color: _pageIndex == 2 ? Colors.amber : Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }

  Widget _buildHomePageContent() {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFF4C53A5)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        suffixIcon: Icon(
                          Icons.camera_alt,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const CategoriesWidget(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Best Selling',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  Icon(Icons.filter_alt, color: Color(0xFF4C53A5)),
                ],
              ),
              const SizedBox(height: 8),
              const ItemsWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
