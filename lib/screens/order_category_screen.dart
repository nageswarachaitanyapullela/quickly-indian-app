import 'package:flutter/material.dart';

class OrderCategoryScreen extends StatefulWidget {
  @override
  _OrderCategoryScreenState createState() => _OrderCategoryScreenState();
}

class _OrderCategoryScreenState extends State<OrderCategoryScreen> {
  final List<String> categories = [
    'Breakfast',
    'Starters',
    'Main Course',
    'Indo-Chinese',
    'Snacks',
    'Desserts',
    'Drinks',
  ];

  late String selectedCategory;

  final Map<String, List<Map<String, dynamic>>> menuItems = {
    'Breakfast': [
      {'name': 'Idli Sambar', 'price': 7.99, 'img': 'assets/images/idli.jpg'},
      {'name': 'Masala Dosa', 'price': 9.99, 'img': 'assets/images/dosa.jpg'},
    ],
    'Starters': [
      {'name': 'Gobi 65', 'price': 8.99, 'img': 'assets/images/gobi.jpg'},
      {
        'name': 'Paneer Tikka',
        'price': 10.99,
        'img': 'assets/images/paneer.jpg'
      },
    ],
    'Main Course': [
      {
        'name': 'Veg Biryani',
        'price': 11.99,
        'img': 'assets/images/biryani.jpg'
      },
      {
        'name': 'Chicken Curry',
        'price': 13.99,
        'img': 'assets/images/curry.jpg'
      },
    ],
    'Indo-Chinese': [
      {
        'name': 'Fried Rice',
        'price': 10.49,
        'img': 'assets/images/friedrice.jpg'
      },
      {
        'name': 'Manchurian',
        'price': 9.99,
        'img': 'assets/images/manchurian.jpg'
      },
    ],
    'Snacks': [
      {'name': 'Punugulu', 'price': 4.99, 'img': 'assets/images/punugulu.jpg'},
      {'name': 'Samosa', 'price': 3.99, 'img': 'assets/images/samosa.jpg'},
    ],
    'Desserts': [
      {'name': 'Gulab Jamun', 'price': 5.49, 'img': 'assets/images/jamun.jpg'},
      {'name': 'Kova Kajaa', 'price': 6.99, 'img': 'assets/images/kajaa.jpg'},
    ],
    'Drinks': [
      {
        'name': 'Filter Coffee',
        'price': 2.99,
        'img': 'assets/images/coffee.jpg'
      },
      {'name': 'Mango Lassi', 'price': 3.99, 'img': 'assets/images/lassi.jpg'},
    ],
  };

  final Map<String, int> itemQuantities = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments as String?;
    selectedCategory = arg ?? 'Breakfast';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final items = menuItems[selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory),
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.textTheme.titleLarge?.color,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Chips
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((cat) {
                final isSelected = cat == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    onSelected: (_) => setState(() => selectedCategory = cat),
                    selectedColor: theme.primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : theme.textTheme.bodyMedium?.color,
                    ),
                    backgroundColor: theme.cardColor,
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 12),

          // Menu Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 1000
                      ? 4
                      : screenWidth > 600
                          ? 3
                          : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 3.8,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final qty = itemQuantities[item['name']] ?? 0;
                  return Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.asset(
                              item['img'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              const SizedBox(height: 4),
                              Text("\$${item['price'].toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor)),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                    onPressed: qty > 0
                                        ? () => setState(() =>
                                            itemQuantities[item['name']] =
                                                qty - 1)
                                        : null,
                                  ),
                                  Text('$qty'),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () => setState(() =>
                                        itemQuantities[item['name']] = qty + 1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
