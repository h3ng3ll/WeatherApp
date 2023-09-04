
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UpPanelProvider extends ChangeNotifier {

  bool  get  openedPanel =>  panelController.isPanelOpen;
  final panelController = PanelController();

  Future<void> openPanel () async {
    await panelController.open();
    notifyListeners();
  }

  Future<void> closePanel () async {
    await panelController.close();
    notifyListeners();
  }

}