import 'package:flutter/material.dart';

class MealPassDeliveryScreen extends StatefulWidget {
  const MealPassDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<MealPassDeliveryScreen> createState() => _MealPassDeliveryScreenState();
}

class _MealPassDeliveryScreenState extends State<MealPassDeliveryScreen> {
  String? selectedBuilding;
  String? selectedSlot;

  final List<String> buildings = [
    'Amazon Vulcan Tower',
    'Meta Lincoln Square',
    'Expedia HQ',
    'Salesforce Tower',
  ];

  final List<String> deliverySlots = [
    '11:45 AM – 12:15 PM',
    '12:30 PM – 1:00 PM',
    '1:15 PM – 1:45 PM',
    '2:00 PM – 2:30 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Meal Pass Delivery"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(24),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Meal Summary",
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Text("Items: 1x South Indian Thali, 1x Filter Coffee"),
                const SizedBox(height: 8),
                const Text("Meals used today: 1 / 2",
                    style: TextStyle(color: Colors.grey)),
                const Divider(height: 32),
                Text("Select Delivery Building",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedBuilding,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  hint: const Text("Choose your office building"),
                  items: buildings
                      .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedBuilding = val),
                ),
                const SizedBox(height: 24),
                Text("Choose Delivery Slot",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedSlot,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  hint: const Text("Select a time window"),
                  items: deliverySlots
                      .map((slot) =>
                          DropdownMenuItem(value: slot, child: Text(slot)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedSlot = val),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Reminder: Meal Pass deliveries must be placed at least 1 hour before the selected slot.",
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: selectedBuilding != null && selectedSlot != null
                        ? () {
                            // TODO: Submit to Firestore and trigger Stripe logic
                          }
                        : null,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text("Confirm & Log Delivery"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
