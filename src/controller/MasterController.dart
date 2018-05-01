import '../view/TableView.dart';

class MasterController {
  TableView _tableView;
  
  void run() {
  	_tableView = new TableView();
  	_tableView.generate();
  } 
}
