import 'dart:html';
import 'View.dart';
import '../model/TableModel.dart';

class TableView implements View {
  TableElement _table;

  TableView() {
    _table = new TableElement();
    _table.id = 'table';
  }

  void generate() {
    for(int row = 0; row < TableModel.ROWS; row++) {
      TableRowElement tableRow = new TableRowElement();

      for(int col = 0; col < TableModel.COLS; col++) {
        TableCellElement tableCell = tableRow.addCell();
        InputElement input = new InputElement();
        input.className = "jscolor";
        input.value = TableModel.DEFAULT_FILL_VALUE;
        tableCell.append(input);
        tableRow.append(tableCell);
      }
      
      _table.append(tableRow);
    }

    document.body.children.add(_table);
  }
}
