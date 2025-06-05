import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String selectedPlan = '';
  String selectedBuilding = '';
  String selectedSlot = '';

  void setPlan(String plan) {
    selectedPlan = plan;
    notifyListeners();
  }

  void setBuilding(String building) {
    selectedBuilding = building;
    notifyListeners();
  }

  void setSlot(String slot) {
    selectedSlot = slot;
    notifyListeners();
  }

  void clearAll() {
    selectedPlan = '';
    selectedBuilding = '';
    selectedSlot = '';
    notifyListeners();
  }
}
