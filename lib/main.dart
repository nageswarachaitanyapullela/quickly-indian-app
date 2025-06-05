import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'firebase_options.dart';
import 'models/app_state.dart';
import 'services/auth_services.dart';

import 'screens/wrapper.dart';
import 'screens/home_screen.dart';
import 'screens/meal_plan_selection_screen.dart';
import 'screens/delivery_screen.dart';
import 'screens/meal_pass_delivery_screen.dart';
import 'screens/order_summary_screen.dart';
import 'screens/order_now_screen.dart';
import 'screens/about_us_screen.dart';
import 'screens/meal_plan_check_screen.dart';
import 'screens/subscription_checkout_screen.dart';
import 'screens/phone_verification_screen.dart';
import 'screens/phone_login_screen.dart';
import 'screens/auth_screen.dart'; // Added for email/Google login

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  Stripe.merchantIdentifier = 'com.quickly.indian';
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        Provider(
            create: (_) =>
                AuthService()), // ✅ Fix: Provide AuthService globally
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quickly Indian',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFDF9F5),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const Wrapper(), // You can set AuthScreen() here if needed
      routes: {
        '/home': (context) => const HomeScreen(),
        '/subscribe': (context) => MealPlanSelectionScreen(),
        '/delivery': (context) => DeliveryScreen(),
        '/summary': (context) => const OrderSummaryScreen(),
        '/ordernow': (context) => OrderNowScreen(),
        '/about': (context) => const AboutUsScreen(),
        '/mealcheck': (context) => MealPlanCheckScreen(),
        '/mealpass': (context) => const MealPassDeliveryScreen(),
        '/phoneLogin': (context) => const PhoneLoginScreen(),
        '/auth': (context) => const AuthScreen(),
        '/verifyPhone': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return PhoneVerificationScreen(
            verificationId: args['verificationId'],
          );
        },
        '/subscriptionCheckout': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return SubscriptionCheckoutScreen(
            planTitle: args['title'],
            price: args['price'],
            meals: args['meals'],
            subtext: args['subText'],
          );
        },
      },
    );
  }
}
