import 'package:flutter/cupertino.dart';

class HeaderSelectionProvider extends ChangeNotifier{
  String? _selectedHeader;
  get getSelectedHeader => _selectedHeader;
  setSelectedHeader(String selectedHeader){
    _selectedHeader = selectedHeader;
    notifyListeners();
  }
}