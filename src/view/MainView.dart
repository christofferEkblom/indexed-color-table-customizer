import 'dart:html';
import '../model/TableModel.dart';

class MainView {
  TableElement _table;

  MainView() {
    
  }

  void generateTable() {
    for(int row = 0; row < TableModel.ROWS; row++) {
      TableRowElement tableRow = new TableRowElement();

      for(int col = 0; col < TableModel.COLS; col++) {
        TableCellElement tableCell = tableRow.addCell();
        tableCell.appendText(TableModel.DEFAULT_FILL_VALUE);
        tableRow.append(tableCell);
      }
      
      _table.append(tableRow);
    }

    document.body.children.add(_table);
  }
}
