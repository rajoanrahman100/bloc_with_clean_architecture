// navigation_service.dart
import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();

  void navigatePushReplacement(BuildContext context,Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void navigatePush(BuildContext context,Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}