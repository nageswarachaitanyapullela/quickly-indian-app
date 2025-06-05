import 'package:flutter/material.dart';
import 'order_summary_screen.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  String selectedBuilding = '';
  String selectedSlot = '';

  final List<String> buildings = [
    'Amazon Block 16',
    'Meta Lincoln Square',
    'Expedia Tower',
    'Brio Apartments',
    'Soma Towers',
  ];

  final List<String> slots = [
    '12:00 PM - 12:30 PM',
    '12:30 PM - 1:00 PM',
    '1:00 PM - 1:30 PM',
    '1:30 PM - 2:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Building & Slot')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedBuilding.isEmpty ? null : selectedBuilding,
              decoration: InputDecoration(labelText: 'Select your building'),
              items: buildings.map((building) {
                return DropdownMenuItem<String>(
                  value: building,
                  child: Text(building),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBuilding = value!;
                  context.read<AppState>().setBuilding(value);
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedSlot.isEmpty ? null : selectedSlot,
              decoration:
                  InputDecoration(labelText: 'Select delivery time slot'),
              items: slots.map((slot) {
                return DropdownMenuItem<String>(
                  value: slot,
                  child: Text(slot),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSlot = value!;
                  context.read<AppState>().setSlot(value);
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: selectedBuilding.isNotEmpty && selectedSlot.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSummaryScreen(),
                        ),
                      );
                    }
                  : null,
              child: Text('Confirm'),
            )
          ],
        ),
      ),
    );
  }
}
