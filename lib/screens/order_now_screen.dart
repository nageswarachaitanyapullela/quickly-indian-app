import 'package:flutter/material.dart';

class OrderNowScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.subscriptions,
      'label': 'Meal Pass',
      'route': '/subscribe',
    },
    {
      'icon': Icons.breakfast_dining,
      'label': 'Breakfast',
      'route': '/menu/breakfast',
    },
    {
      'icon': Icons.fastfood,
      'label': 'Starters',
      'route': '/menu/starters',
    },
    {
      'icon': Icons.rice_bowl,
      'label': 'Main Course',
      'route': '/menu/main',
    },
    {
      'icon': Icons.ramen_dining,
      'label': 'Indo-Chinese',
      'route': '/menu/indo_chinese',
    },
    {
      'icon': Icons.cookie,
      'label': 'Snacks',
      'route': '/menu/snacks',
    },
    {
      'icon': Icons.icecream,
      'label': 'Desserts',
      'route': '/menu/desserts',
    },
    {
      'icon': Icons.local_cafe,
      'label': 'Drinks',
      'route': '/menu/drinks',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 1200
        ? 5
        : screenWidth > 1000
            ? 4
            : screenWidth > 700
                ? 3
                : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Now'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: const Color(0xFFFDF9F5),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return _CategoryTile(
              icon: category['icon'],
              label: category['label'],
              onTap: () => Navigator.pushNamed(context, category['route']),
              theme: theme,
            );
          },
        ),
      ),
    );
  }
}

class _CategoryTile extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final ThemeData theme;

  const _CategoryTile({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.theme,
  });

  @override
  State<_CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<_CategoryTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isHovered
                ? widget.theme.primaryColor.withOpacity(0.06)
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? widget.theme.primaryColor.withOpacity(0.2)
                    : Colors.black12,
                blurRadius: isHovered ? 24 : 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 40, color: widget.theme.primaryColor),
              const SizedBox(height: 12),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: widget.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: widget.theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
