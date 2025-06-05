# Quickly Indian 🍛🇮🇳

> **Smart South Indian Meals — Fresh. Fast. Personalized.**

Quickly Indian is a modern Flutter-based food delivery app focused on delivering authentic South Indian meals to customers in the Bellevue and Seattle area. It supports à la carte pickup, subscription-based meal plans, catering, and smart delivery slots based on building and time window.

---

## 🚀 Features

- 🔐 Firebase Authentication (phone, Google, email)
- 🧾 Meal Pass Subscriptions (1-week, 2-week, 1-month)
- 🛍️ À la carte "Order Now" with category selection
- 🏢 Smart delivery by building & time slot
- 🥘 Catering requests with scheduling
- 📦 Order tracking UI
- 🎁 Rewards system
- 💳 Stripe Payment integration
- 📱 Responsive UI for Mobile / Tablet / Web

---

## 🛠️ Tech Stack

| Area       | Tech Used                          |
| ---------- | ---------------------------------- |
| Frontend   | Flutter (Web + Mobile)             |
| Auth       | Firebase Authentication            |
| Backend    | Firebase Firestore & Functions     |
| Payments   | Stripe (Test Mode + Subscriptions) |
| Maps       | Google Maps Flutter                |
| Deployment | GitHub + Firebase Hosting (TBD)    |

---

## 📷 Screenshots

> Add here:
>
> - Home Screen
> - Order Now
> - Meal Pass Flow
> - Subscription Checkout
> - Order Tracking

---

## 📦 Getting Started

1. **Clone this repo:**
   ```bash
   git clone https://github.com/your-username/quickly-indian.git
   cd quickly-indian
   Install dependencies:
   flutter pub get
   ```

Run the app:

```bash

flutter run -d chrome # for web
flutter run # for mobile
```
Firebase Setup:

Ensure you’ve configured Firebase project

Add google-services.json (Android) and GoogleService-Info.plist (iOS)

Add Firebase config in web/index.html for web support

Google Maps Setup:

Add your Google Maps API key in the respective Android, iOS and web configuration files to enable the map view on the order tracking screen.

Stripe Setup:

1. Copy `secrets/.env.sample` to `secrets/.env` and add your test keys.
2. Install dependencies with `flutter pub get` after adding the keys.
3. Payments are processed in test mode via Stripe's payment sheet.

🤝 Contributing
Pull requests welcome! Please fork the repository and submit a PR.
