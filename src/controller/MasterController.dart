import '../view/View.dart';
import '../view/TableView.dart';
import '../view/ToolPanelView.dart';

class MasterController {
  View _tableView,
  _toolPanelView;
  
  void run() {
  	_tableView = new TableView();
  	_toolPanelView = new ToolPanelView();

  	_tableView.generate();
  	_toolPanelView.generate();
  } 
}
