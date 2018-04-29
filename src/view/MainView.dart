import 'dart:html';
import '../model/TableModel.dart';

class MainView {
  TableModel _tableModel;
  TableElement _table;

  MainView(TableModel tableModel) {
    _tableModel = tableModel;
    _table = new TableElement();
  }

  void generateTable() {
    for(int row = 0; row < _tableModel.rows; row++) {
      TableRowElement tableRow = new TableRowElement();

      for(int col = 0; col < _tableModel.cols; col++) {
        TableCellElement tableCell = tableRow.addCell();
        tableCell.appendText(_tableModel.initialColor);
        tableRow.append(tableCell);
      }
      
      _table.append(tableRow);
    }

    document.body.children.add(_table);
  }
}
