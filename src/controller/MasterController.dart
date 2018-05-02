import 'dart:html';
import '../model/TableModel.dart';
import '../view/TableView.dart';
import '../view/ToolPanelView.dart';

class MasterController {
  TableModel _tableModel;
  TableView _tableView;
  ToolPanelView _toolPanelView;

  MasterController() {
    _tableView = new TableView();
    _toolPanelView = new ToolPanelView();
    _tableModel = new TableModel();
  }
  
  void run() {
  	_toolPanelView.generate();
  	_handleToolPanelEvents();

  	_tableView.generate();
  }

  void _handleToolPanelEvents() {
    _toolPanelView.plusButton.onClick.listen(_plusButtonIsClicked);
    _toolPanelView.minusButton.onClick.listen(_minusButtonIsClicked);
    _toolPanelView.downloadButton.onClick.listen(_downloadButtonIsClicked);
  }

  void _plusButtonIsClicked(MouseEvent e) {
    _tableModel.increaseCursor();
    _tableView.showColorControl(_tableModel.cursor);
  }

  void _minusButtonIsClicked(MouseEvent e) {
    _tableModel.decreaseCursor();
    _tableView.hideColorControl(_tableModel.cursor);
  }

  void _downloadButtonIsClicked(MouseEvent e) {
    _tableModel.createBinaryFile(_tableView.toStringList());
  }
}
