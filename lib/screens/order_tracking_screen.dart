import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Displays the live status of an order along with a map preview.
class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController _mapController;
  final LatLng _restaurantLocation = const LatLng(47.6101, -122.2015);
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('restaurant'),
      position: LatLng(47.6101, -122.2015),
      infoWindow: InfoWindow(title: 'Quickly Indian'),
    ),
  };
  final List<String> _statusSteps = const [
    'Order Confirmed',
    'Being Prepared',
    'Out for Delivery',
    'Delivered',
  ];

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Order'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _restaurantLocation,
                    zoom: 14,
                  ),
                  markers: _markers,
                  onMapCreated: (c) => _mapController = c,
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Live Status',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Stepper(
              physics: const NeverScrollableScrollPhysics(),
              currentStep: _currentStep,
              controlsBuilder: (_, __) => const SizedBox.shrink(),
              steps: _statusSteps
                  .map(
                    (s) => Step(
                      title: Text(s),
                      content: const SizedBox.shrink(),
                      isActive: _statusSteps.indexOf(s) <= _currentStep,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStep =
                      _currentStep == _statusSteps.length - 1 ? 0 : _currentStep + 1;
                });
              },
              child: const Text('Advance Status'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

