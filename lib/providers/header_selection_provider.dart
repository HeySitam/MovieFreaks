import 'package:flutter/cupertino.dart';

class HeaderSelectionProvider extends ChangeNotifier{
  String? _selectedHeader;
  bool _shouldExpand = false;
  get getSelectedHeader => _selectedHeader;
  get getShouldExpand => _shouldExpand;

  setSelectedHeader(String selectedHeader){
    _selectedHeader = selectedHeader;
    notifyListeners();
  }

  setShouldExpand(bool shouldExpandInfo){
    _shouldExpand = shouldExpandInfo;
    notifyListeners();
  }
}