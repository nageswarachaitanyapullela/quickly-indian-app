import 'package:flutter/material.dart';
import '../widgets/quickly_app_scaffold.dart';

class MealPlanSelectionScreen extends StatefulWidget {
  @override
  State<MealPlanSelectionScreen> createState() =>
      _MealPlanSelectionScreenState();
}

class _MealPlanSelectionScreenState extends State<MealPlanSelectionScreen> {
  int selectedIndex = 0;
  int hoveredIndex = -1;

  final List<Map<String, dynamic>> plans = [
    {
      'title': '1 Week Pass',
      'price': '\$44.95',
      'meals': '5 Meals',
      'subText': '\$10.99 per meal',
    },
    {
      'title': '2 Week Pass',
      'price': '\$95.99',
      'meals': '10 Meals',
      'subText': '\$9.59 per meal',
    },
    {
      'title': '1 Month Pass',
      'price': '\$189.99',
      'meals': '20 Meals',
      'subText': 'Save 17%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedPlan = plans[selectedIndex];

    return QuicklyAppScaffold(
      showBack: true,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(
              "Choose Your Meal Pass",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Enjoy savings and convenience when you buy multiple meals.",
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: plans.length,
                itemBuilder: (context, index) {
                  final plan = plans[index];
                  final isSelected = index == selectedIndex;
                  final isHovered = index == hoveredIndex;

                  return MouseRegion(
                    onEnter: (_) => setState(() => hoveredIndex = index),
                    onExit: (_) => setState(() => hoveredIndex = -1),
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: Matrix4.identity()
                          ..scale((isHovered || isSelected) ? 1.03 : 1.0),
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: (isHovered || isSelected)
                              ? theme.primaryColor.withAlpha(20)
                              : theme.cardColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? theme.primaryColor
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (isHovered || isSelected)
                                  ? theme.primaryColor.withAlpha(64)
                                  : Colors.black12,
                              blurRadius: (isHovered || isSelected) ? 20 : 6,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(plan['title'],
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text(plan['subText'],
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w500,
                                )),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(plan['meals'],
                                    style: theme.textTheme.bodyMedium),
                                Text(plan['price'],
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Selected Plan:", style: theme.textTheme.bodyMedium),
                      Text(selectedPlan['title'],
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:", style: theme.textTheme.titleMedium),
                      Text(selectedPlan['price'],
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/subscriptionCheckout',
                          arguments: {
                            'title': selectedPlan['title'],
                            'price': selectedPlan['price'],
                            'meals': selectedPlan['meals'],
                            'subText': selectedPlan['subText'],
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Subscribe & Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
