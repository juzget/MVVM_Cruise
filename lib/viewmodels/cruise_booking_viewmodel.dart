import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';
class CruiseBookingViewModel extends ChangeNotifier {

  final CruiseDestination _destination = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements while experiencing authentic Sarawakian hospitality.',
    imageUrl: 'https://ik.imgkit.net/3vlqs5axxjf/TW-Asia/uploadedImages/Industry/Cruise/Borneo-River-Cruise-Beneath-Sibu-City-Skyline-261028.jpg',
    ratingCount: 43,
  );

  DateTime _selectedDate = DateTime(2026, 11, 15);
  String _selectedPackage = 'Express Boat';
  bool _isDarkMode = false;

  final List<String> _availablePackages = [
    'Express Boat',
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Getters (To be read by UI View)
  CruiseDestination get destination => _destination;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  List<String> get availablePackages => _availablePackages;

  // Methods / Actions to change and update the UI

  // 1. Change Visitation Date (Visit Date Picker)
  void updateVisitDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners(); // Announce the change to the UI
  }

  // 2. Change Cruising Package (Dropdown)
  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  // 3. Change Light / Dark Mode (Switch)
  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  // 4. Added Dynamic Star Count when the button icon pressed
  void incrementStarRating() {
    _destination.ratingCount++;
    notifyListeners();
  }
}