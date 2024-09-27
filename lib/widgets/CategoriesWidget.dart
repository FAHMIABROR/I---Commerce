import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {'name': 'Makanan', 'icon': Icons.fastfood},
      {'name': 'Fashion', 'icon': Icons.checkroom}, 
      {'name': 'Elektronik', 'icon': Icons.electrical_services}, 
      {'name': 'Skincare', 'icon': Icons.soap_outlined},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var category in categories)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    category['icon'],
                    size: 30,
                    color: const Color(0xFF4C53A5),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    category['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
