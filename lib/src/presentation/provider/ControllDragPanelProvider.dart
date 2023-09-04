





import 'package:flutter/foundation.dart';

class ControlDragPanelProvider extends ChangeNotifier{

  bool isDraggable = true;

  void setDraggableStatus (bool status) {
    isDraggable  = status;
    notifyListeners();
  }


}