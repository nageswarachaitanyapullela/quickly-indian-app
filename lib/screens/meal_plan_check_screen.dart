import 'package:flutter/material.dart';
import '../widgets/quickly_app_scaffold.dart';

class MealPlanCheckScreen extends StatelessWidget {
  final bool hasSubscription = false; // Replace with real logic later

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return QuicklyAppScaffold(
      showBack: true,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                hasSubscription ? Icons.verified : Icons.warning_amber_rounded,
                size: 64,
                color:
                    hasSubscription ? theme.primaryColor : Colors.orangeAccent,
              ),
              const SizedBox(height: 20),
              Text(
                hasSubscription
                    ? "You're Subscribed!"
                    : "Daily Meals Delivered to Your Office or Home",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                hasSubscription
                    ? "You're all set! Let's continue to your meal selection."
                    : "Quickly Indian delivers fresh South Indian meals to offices and residences across Bellevue Downtown, Soma Towers, Vue Apartments, Amazon Vulcan, Meta Lincoln, and more.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              if (!hasSubscription)
                Column(
                  children: [
                    _BenefitRow("✔️ Free building delivery to office & home"),
                    _BenefitRow("✔️ Meals from \$9.49/day"),
                    _BenefitRow("✔️ No cooking or waiting in line"),
                    _BenefitRow(
                        "✔️ Smart renewal notifications before plan expiry"),
                  ],
                ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          hasSubscription ? '/mealpass' : '/subscribe');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(WidgetState.hovered)) {
                          return theme.primaryColor.withOpacity(0.9);
                        }
                        return theme.primaryColor;
                      }),
                      foregroundColor:
                          WidgetStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.white;
                        }
                        return Colors.white;
                      }),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 14),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    child: Text(
                      hasSubscription
                          ? "Continue to Meal Selection"
                          : "Subscribe for the Meal Pass Now",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BenefitRow extends StatelessWidget {
  final String text;
  const _BenefitRow(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
