import 'dart:html';
import '../model/TableModel.dart';
import '../view/TableView.dart';
import '../view/ToolPanelView.dart';

class MasterController {
  TableView _tableView;
  ToolPanelView _toolPanelView;

  MasterController() {
    _tableView = new TableView();
    _toolPanelView = new ToolPanelView();
  }
  
  void run() {
  	_toolPanelView.generate();
  	_handleToolPanelEvents();

  	_tableView.generate();
  }

  void _handleToolPanelEvents() {
    _toolPanelView.plusButton.onClick.listen(_plusButtonIsClicked);
    _toolPanelView.minusButton.onClick.listen(_minusButtonIsClicked);
  }

  void _plusButtonIsClicked(MouseEvent e) {
    TableModel.increaseCursor();
    _tableView.showColorControl(TableModel.cursor);
  }

  void _minusButtonIsClicked(MouseEvent e) {
    TableModel.decreaseCursor();
    _tableView.hideColorControl(TableModel.cursor);
  }
}
