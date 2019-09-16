import 'package:flutter/foundation.dart';

class TahunFilter with ChangeNotifier{
  String _dropdownValue = '2019';
  List<String> _listtahun = ['2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020'];
 
 
  String get dropdownValue => _dropdownValue;
  List<String> get listtahun => _listtahun;

  set dropdownValue(String value ){
    _dropdownValue = value;
    notifyListeners();
  }



}