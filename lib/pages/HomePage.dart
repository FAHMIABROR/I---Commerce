
import 'package:e_commerce/pages/ProfilePage.dart';
import 'package:e_commerce/pages/cartPage.dart';
import 'package:e_commerce/widgets/CategoriesWidget.dart';
import 'package:e_commerce/widgets/HomeAppBar.dart';
import 'package:e_commerce/widgets/ItemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; 

  final List<Widget> _pages = [
    HomePageContent(),
    CartPage(), 
    Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: 70,
        color: const Color(0xFF4C53A5),
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            size: 32,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

// Widget untuk halaman utama
class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomeAppBar(),
        Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 50,
                      width: 300,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.camera_alt,
                      size: 27,
                      color: Color(0xFF4C53A5),
                    ),
                  ],
                ),
              ),
              // Categories
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5)),
                ),
              ),
              const CategoriesWidget(),
              // Best Selling
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Best Selling',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
              ItemsWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget untuk halaman keranjang belanja
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Shopping Cart Page', style: TextStyle(fontSize: 24)),
    );
  }
}



 