import 'package:flutter/material.dart';

class ScrollControllerProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  void moveTo(double x) {
    scrollController.animateTo(
      x,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
