import 'package:flutter/foundation.dart';

class SemesterFilter with ChangeNotifier{
  int _selectedsms1 = 1;
  int _selectedsms2 = 0;
  int _semester = 1;
 
 
  int get selectedsms1 => _selectedsms1;
  int get selectedsms2 => _selectedsms2;
  int get semester => _semester;

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