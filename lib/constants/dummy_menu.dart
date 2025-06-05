class DummyMenu {
  static List<Map<String, dynamic>> mealPassItems = [
    {
      "name": "Mini Veg Thali",
      "description": "Includes rice, sambar, rasam, curry, curd",
      "price": 0.0, // Free with pass
      "image": "assets/images/veg_thali.png"
    },
    {
      "name": "Chicken Bowl",
      "description": "Spicy chicken over millet rice with chutneys",
      "price": 0.0,
      "image": "assets/images/chicken_bowl.png"
    },
    {
      "name": "Egg Curry Combo",
      "description": "2 eggs in gravy + rice and salad",
      "price": 0.0,
      "image": "assets/images/egg_combo.png"
    },
  ];

  static List<Map<String, dynamic>> alaCarteItems = [
    {
      "name": "Masala Dosa",
      "description": "Crispy dosa with spiced potato filling",
      "price": 7.99,
      "image": "assets/images/masala_dosa.png",
      "category": "Breakfast"
    },
    {
      "name": "Paneer Biryani",
      "description": "Hyderabadi-style biryani with paneer",
      "price": 11.99,
      "image": "assets/images/paneer_biryani.png",
      "category": "Main Course"
    },
    {
      "name": "Chicken Manchurian",
      "description": "Crispy Indo-Chinese chicken starter",
      "price": 10.99,
      "image": "assets/images/chicken_manchurian.png",
      "category": "Starters"
    },
    {
      "name": "Gulab Jamun",
      "description": "Soft dessert in sugar syrup",
      "price": 3.49,
      "image": "assets/images/gulab_jamun.png",
      "category": "Desserts"
    },
    {
      "name": "Filter Coffee",
      "description": "Authentic South Indian coffee",
      "price": 2.49,
      "image": "assets/images/filter_coffee.png",
      "category": "Drinks"
    },
  ];
}
