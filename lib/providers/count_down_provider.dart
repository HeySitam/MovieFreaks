import 'package:flutter/cupertino.dart';

class CountDownProvider extends ChangeNotifier {
  int _countDown = 100;

  get getCountDown => _countDown;

  void setCountDown() {
    if(_countDown > 0){
      _countDown--;
    }
    notifyListeners();
  }
}
