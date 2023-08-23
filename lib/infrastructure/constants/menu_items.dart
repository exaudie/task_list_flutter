import '../enums/menu_home.dart';

class MenuItems {
  static const List<Map<String, dynamic>> popupMenuList = [
    {'label': 'Add Task', 'value': MenuHome.addTask},
    {'label': 'Period', 'value': MenuHome.period},
    {'label': 'Settings', 'value': MenuHome.setting},
  ];
}
