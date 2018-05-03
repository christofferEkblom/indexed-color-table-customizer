import 'dart:html';
import 'View.dart';
import '../model/TableDataHandler.dart';

class TableView implements View {
  TableElement _table;

  TableView() {
    _table = new TableElement();
  }

  void generate() {
    for(int row = 0, id = 1; row < TableDataHandler.ROWS; row++) {
      TableRowElement tableRow = new TableRowElement();

      for(int col = 0; col < TableDataHandler.COLS; col++, id++) {
        TableCellElement tableCell = tableRow.addCell();
        InputElement input = new InputElement();
        input.classes.add('jscolor');
        input.id = 'color-control-' + id.toString();

        if(row == 0 && col == 0) {
          input.classes.add('visible');
        }

        input.value = TableDataHandler.DEFAULT_FILL_VALUE;
        tableCell.append(input);
        tableRow.append(tableCell);
      }
      
      _table.append(tableRow);
    }

    document.body.children.add(_table);
  }

  void loadTable(List<String> colors) {
    ElementList allColorControls = querySelectorAll('.jscolor');

    for(int i = 0; i < allColorControls.length; i++) {
      allColorControls[i].value = colors[i];
      allColorControls[i].classes.add('visible');
      allColorControls[i].select();
    }
  }

  void showColorControl(int elementNumber) {
    InputElement colorControl = querySelector('#color-control-' + elementNumber.toString());
    colorControl.classes.add('visible');
  }

  void hideColorControl(int elementNumber) {
    InputElement colorControl = querySelector('#color-control-' + (elementNumber + 1).toString());
    colorControl.classes.remove('visible');
  }

  List<String> toStringList() {
    List<String> data = new List<String>();
    ElementList visibleControls = querySelectorAll('.visible');

    visibleControls.forEach((element) => data.add(element.value));

    return data;
  }
}
