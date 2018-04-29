import '../model/TableModel.dart';
import '../view/MainView.dart';

class MasterController {
  TableModel _tableModel;
  MainView _mainView;
  
  void run() {
  	_tableModel = new TableModel(16, 16, "000000");
  	_mainView = new MainView(_tableModel);
  	_mainView.generateTable();
  } 
}
