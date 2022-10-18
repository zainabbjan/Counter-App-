import 'dart:developer';
import 'dart:math';
import 'package:constcolor/core/const.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;
  Color backgroundColor = primaries.first;

  var random = Random();

  void incrementCounter() {
    if (count < 10) {
      _count += 1;
      if (count == 10) {
        getRandomColor();
      }
    } else if (count >= 10 && count < 100) {
      _count += 10;
      if (count == 100) {
        getRandomColor();
      }
    } else if (count >= 100 && count < 1000) {
      _count += 100;
      if (count == 1000) {
        getRandomColor();
      }
    } else if (count >= 1000 && count < 10000) {
      _count += 1000;
      if (count == 10000) {
        getRandomColor();
      }
    } else if (count >= 10000 && count < 100000) {
      _count += 10000;
      if (count == 100000) {
        getRandomColor();
      }
    } else {
      _count += 10000;
    }
    notifyListeners();
  }

  void getRandomColor() {
    var random = Random();
    Color randomColor = primaries[random.nextInt(primaries.length)];
    if (randomColor == backgroundColor) {
      getRandomColor();
    } else {
      backgroundColor = randomColor;
    }
    notifyListeners();
  }
}
