import 'package:flutter/foundation.dart';

class NavigationProvider with ChangeNotifier {
  int _serviceIndex = 0;
  int _widgetIndex = 0;

  int get serviceIndex {
    int temp = _serviceIndex;
    return temp;
  }

  int get widgetIndex {
    int temp = _widgetIndex;
    return temp;
  }

  void changeServiceIndex(int index) {
    _serviceIndex = index;
    notifyListeners();
  }

  void changeWidgetIndex(int index) {
    _widgetIndex = index;
    notifyListeners();
  }
}
