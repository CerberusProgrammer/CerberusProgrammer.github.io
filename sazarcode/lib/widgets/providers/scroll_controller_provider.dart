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

  void moveToAbout() {
    scrollController.animateTo(
      scrollController.position.viewportDimension * 1.1,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void moveToWork() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent -
          scrollController.position.viewportDimension * 2,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void moveToFooter() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
