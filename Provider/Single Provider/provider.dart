import 'package:flutter/cupertino.dart';

class ProviderHelper extends ChangeNotifier {

  int _counter = 0;

  int get counter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

}