import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder status stages
    final List<String> statusSteps = [
      "Order Confirmed",
      "Being Prepared",
      "Out for Delivery",
      "Delivered",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Track Your Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Live Status",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ...statusSteps.map((step) {
              return ListTile(
                leading:
                    Icon(Icons.radio_button_checked, color: Colors.deepOrange),
                title: Text(step),
              );
            }).toList(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text("Back to Home"),
            )
          ],
        ),
      ),
    );
  }
}
