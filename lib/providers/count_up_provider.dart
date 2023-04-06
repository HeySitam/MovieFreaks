import 'package:flutter/cupertino.dart';

class CountUpProvider extends ChangeNotifier {
  int _countUp = 0;

  get getCountUp => _countUp;

  void setCountUp() {
    _countUp++;
    notifyListeners();
  }
}
