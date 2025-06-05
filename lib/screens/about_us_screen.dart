import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F5),
      appBar: AppBar(
        title: const Text("About Us"),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.local_dining, size: 64, color: Colors.deepOrange),
            const SizedBox(height: 16),
            const Text(
              "Welcome to Quickly Indian",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "We’re not just delivering food — we’re delivering culture, warmth, and tradition with every meal.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            sectionTitle("🌶️ Our Flavor Story"),
            sectionText(
              "Quickly Indian brings authentic South Indian flavors into the heart of Bellevue. Our chefs craft each dish using traditional spices and modern kitchen tech, balancing taste with consistency.",
            ),
            const SizedBox(height: 20),
            sectionTitle("👨‍🍳 Who We Are"),
            sectionText(
              "Founded by food lovers and built for busy professionals, our team is passionate about reinventing how Indian food is served — fast, fresh, and perfectly portioned.",
            ),
            const SizedBox(height: 20),
            sectionTitle("🚀 Our Smart Tech"),
            sectionText(
              "From app-based ordering with delivery windows to curated meal passes and daily tracking — we use technology to create a seamless dining experience for office-goers and families alike.",
            ),
            const SizedBox(height: 20),
            sectionTitle("📦 Our Promise"),
            sectionText(
              "Clean kitchens, premium ingredients, eco-friendly packaging, and on-time delivery. Whether you're ordering lunch or stocking up with a meal pass, quality is guaranteed.",
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to contact or help screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Get in Touch"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.deepOrange,
      ),
    );
  }

  Widget sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.black87),
      ),
    );
  }
}
