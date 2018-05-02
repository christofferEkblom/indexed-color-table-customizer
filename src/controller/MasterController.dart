import 'dart:html';
import '../model/ColorTable.dart';
import '../model/BinaryFileCreator.dart';
import '../view/TableView.dart';
import '../view/ToolPanelView.dart';

class MasterController {
  ColorTable _colorTable;
  BinaryFileCreator _binaryFileCreator;
  TableView _tableView;
  ToolPanelView _toolPanelView;

  MasterController() {
    _tableView = new TableView();
    _toolPanelView = new ToolPanelView();
    _colorTable = new ColorTable();
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
    _colorTable.increaseCursor();
    _tableView.showColorControl(_colorTable.cursor);
  }

  void _minusButtonIsClicked(MouseEvent e) {
    _colorTable.decreaseCursor();
    _tableView.hideColorControl(_colorTable.cursor);
  }

  void _downloadButtonIsClicked(MouseEvent e) {
    var bytes = _colorTable.getBytes(_tableView.toStringList());
    _binaryFileCreator.downloadFile(bytes);
  }
}
