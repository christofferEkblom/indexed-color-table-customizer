import 'dart:html';
import '../model/TableDataHandler.dart';
import '../model/BinaryFileCreator.dart';
import '../model/SampleDataHandler.dart';
import '../view/TableView.dart';
import '../view/ToolPanelView.dart';
import '../view/CatalogView.dart';

class MasterController {
  TableDataHandler _tableDataHandler;
  BinaryFileCreator _binaryFileCreator;
  SampleDataHandler _sampleDataHandler;
  TableView _tableView;
  ToolPanelView _toolPanelView;
  CatalogView _catalogView;

  bool _focused = true;

  MasterController() {
    _tableView = new TableView();
    _toolPanelView = new ToolPanelView();
    _tableDataHandler = new TableDataHandler();
    _binaryFileCreator = new BinaryFileCreator();
    _sampleDataHandler = new SampleDataHandler();
  }
  
  void run() {
    _renderCatalog();
    _tableView.generate();
    _toolPanelView.generate();
    _handleEvents();
  }

  void _handleEvents() {
    window.onFocus.listen(_setFocus);
    window.onBlur.listen(_unsetFocus);

    _toolPanelView.plusButton.onClick.listen(_plusButtonIsClicked);
    _toolPanelView.minusButton.onClick.listen(_minusButtonIsClicked);
    _toolPanelView.downloadButton.onClick.listen(_downloadButtonIsClicked);
    _toolPanelView.catalogButton.onClick.listen(_catalogButtonIsClicked);
    _toolPanelView.uploadButton.onChange.listen(_updateTableOnFocus);

    _catalogView.closeButton.onClick.listen(_catalogCloseButtonIsClicked);
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

  void _catalogButtonIsClicked(MouseEvent e) {
    _catalogView.show();
  }

  void _catalogCloseButtonIsClicked(MouseEvent e) {
    _catalogView.hide();
  }

  void _updateTableOnFocus(Event e) {
    if(_focused) {
      _updateTable();
    } else {
      window.onFocus.first.then((_) {
        _updateTable();
      });
    }
  }

  void _updateTable() {
    var reader = _binaryFileCreator.uploadFile(_toolPanelView.uploadButton);
    List<int> bytes;

    reader.onLoad.first.then((_) {
      bytes = reader.result;
      _tableView.loadTable(_tableDataHandler.bytesToHexList(bytes));
      _tableDataHandler.setCursorAtTheEnd();
    });

    reader.onError.first.then((error) {
      throw new Exception();
    });
  }

  void _renderCatalog() {
    _catalogView = new CatalogView();

    _sampleDataHandler.getJsonFile().then((data) {
      _catalogView.getData(data);
      _catalogView.generate();
      _catalogView.hide();
    });
  }

  void _setFocus(Event e) {
    _focused = true;
  }

  void _unsetFocus(Event e) {
    _focused = false;
  }
}
