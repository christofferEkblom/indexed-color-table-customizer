import 'dart:html';
import '../model/TableDataHandler.dart';
import '../model/BinaryFileCreator.dart';
import '../view/TableView.dart';
import '../view/ToolPanelView.dart';

class MasterController {
  TableDataHandler _tableDataHandler;
  BinaryFileCreator _binaryFileCreator;
  TableView _tableView;
  ToolPanelView _toolPanelView;

  MasterController() {
    _tableView = new TableView();
    _toolPanelView = new ToolPanelView();
    _tableDataHandler = new TableDataHandler();
    _binaryFileCreator = new BinaryFileCreator();
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
    _tableDataHandler.increaseCursor();
    _tableView.showColorControl(_tableDataHandler.cursor);
  }

  void _minusButtonIsClicked(MouseEvent e) {
    _tableDataHandler.decreaseCursor();
    _tableView.hideColorControl(_tableDataHandler.cursor);
  }

  void _downloadButtonIsClicked(MouseEvent e) {
    var bytes = _tableDataHandler.getBytes(_tableView.toStringList());
    _binaryFileCreator.downloadFile(bytes);
  }
}
