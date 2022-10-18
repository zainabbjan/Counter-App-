import 'dart:developer';
import 'dart:math';
import 'package:constcolor/core/enum/colorChanged.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  Color backgroundColor = Colors.white;
  var random = Random();
  ColorEnum colorEnum = ColorEnum.unit;

  void incrementCounter() {
    if (counter < 9) {
      checkCounter(ColorEnum.unit, ColorEnum.ten);
      _counter++;
    } else if (counter >= 9 && counter < 90) {
      checkCounter(ColorEnum.ten, ColorEnum.hundred);
      _counter += _counter == 9 ? 1 : 10;
    } else if (counter >= 90 && counter < 900) {
      checkCounter(ColorEnum.hundred, ColorEnum.thousand);
      _counter += _counter == 90 ? 10 : 100;
    } else if (counter >= 900 && counter < 9000) {
      checkCounter(ColorEnum.thousand, ColorEnum.tenThousand);
      _counter += _counter == 900 ? 100 : 1000;
    } else if (counter >= 9000 && counter < 90000) {
      _counter += _counter == 9000 ? 1000 : 10000;
      checkCounter(ColorEnum.tenThousand, ColorEnum.humdredThousand);
    } else if (counter >= 90000 && counter < 900000) {
      checkCounter(ColorEnum.humdredThousand, ColorEnum.million);
      _counter += _counter == 90000 ? 10000 : 100000;
    } else {
      _counter += 100000;
    }

    notifyListeners();
  }

  checkCounter(ColorEnum check, ColorEnum next) {
    if (colorEnum == check) {
      getRandomColor();
    }
    colorEnum = next;
  }

  static const List<MaterialColor> _primaries = <MaterialColor>[
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.yellow,
    Colors.blueGrey,
  ];
  List<MaterialColor> get primaries => _primaries;

  void getRandomColor() {
    var random = Random();
    Color randomColor = _primaries[random.nextInt(_primaries.length)];

    notifyListeners();
  }
}
