import 'package:get/state_manager.dart';

class HorariosController extends GetxController {
  String _selectedDia = "util";

  void setDia(value) {
    switch (value) {
      case 0:
        _selectedDia = 'util';
        update();
        break;
      case 1:
        _selectedDia = 'sabado';
        update();
        break;
      case 2:
        _selectedDia = 'domingo';
        update();
        break;
      default:
        break;
    }
  }

  int reverseDia() {
    switch (_selectedDia) {
      case "util":
        return 0;
      case 'sabado':
        return 1;
      case 'domingo':
        return 2;
      default:
        return -1;
    }
  }

  String getDia() {
    update();
    return _selectedDia;
  }

  String testeDia() {
    return _selectedDia;
  }
}
