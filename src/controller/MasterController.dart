import '../view/MainView.dart';

class MasterController {
  MainView _mainView;
  
  void run() {
  	_mainView = new MainView();
  	_mainView.generateTable();
  } 
}
