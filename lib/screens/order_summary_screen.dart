import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(title: Text('Order Summary')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Meal Plan:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(appState.selectedPlan),
            SizedBox(height: 16),
            Text("Delivery Location:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(appState.selectedBuilding),
            SizedBox(height: 16),
            Text("Time Slot:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(appState.selectedSlot),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mealpass');
              },
              child: Text("Confirm Order"),
            ),
          ],
        ),
      ),
    );
  }
}
