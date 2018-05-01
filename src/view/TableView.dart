import 'dart:html';
import 'View.dart';
import '../model/TableModel.dart';

class TableView implements View {
  TableElement _table;

  TableView() {
    _table = new TableElement();
  }

  void generate() {
    for(int row = 0, id = 1; row < TableModel.ROWS; row++) {
      TableRowElement tableRow = new TableRowElement();

      for(int col = 0; col < TableModel.COLS; col++, id++) {
        TableCellElement tableCell = tableRow.addCell();
        InputElement input = new InputElement();
        input.classes.add('jscolor');
        input.id = 'color-control-' + id.toString();

        if(row != 0 || col != 0) {
          input.classes.add('invisible');
        }

        input.value = TableModel.DEFAULT_FILL_VALUE;
        tableCell.append(input);
        tableRow.append(tableCell);
      }
      
      _table.append(tableRow);
    }

    document.body.children.add(_table);
  }

  void showColorControl(int elementNumber) {
    InputElement colorControl = querySelector('#color-control-' + elementNumber.toString());
    colorControl.classes.remove('invisible');
  }

  void hideColorControl(int elementNumber) {
    InputElement colorControl = querySelector('#color-control-' + (elementNumber + 1).toString());
    colorControl.classes.add('invisible');
  }
}
