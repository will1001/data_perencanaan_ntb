import 'package:flutter/foundation.dart';

class APIProvider with ChangeNotifier{
  String _dropdownValue = DateTime.now().toString().substring(0,4);
   int _selectedsms1 = 1;
  int _selectedsms2 = 0;
  int _semester = 1;
 
 
  String get dropdownValue => _dropdownValue;
  int get selectedsms1 => _selectedsms1;
  int get selectedsms2 => _selectedsms2;
  int get semester => _semester;

  
 
  set dropdownValue(String value ){
    _dropdownValue = value;
    notifyListeners();
  }

  set semester(int value ){
    _semester = value;
    notifyListeners();
  }
  
  set selectedsms1(int value ){
    _selectedsms1 = value;
    notifyListeners();
  }
  
  set selectedsms2(int value ){
    _selectedsms2 = value;
    notifyListeners();
  }



}