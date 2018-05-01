import 'dart:html';
import 'View.dart';

class ToolPanelView implements View {
  DivElement _toolPanel;
  ButtonElement _addButton;
  ButtonElement _minusButton;

  ButtonElement get addButton => _addButton;
  ButtonElement get minusButton => _minusButton;

  ToolPanelView() {
    _toolPanel = new DivElement();
    _toolPanel.id = 'tool-panel';
    _addButton = new ButtonElement();
    _minusButton = new ButtonElement();
  }

  void generate() {
  	_toolPanel.append(_generatePlusButton());
  	_toolPanel.append(_generateMinusButton());
    document.body.children.add(_toolPanel);
  }

  ButtonElement _generatePlusButton() {
    _addButton.id = 'add';
    _addButton.appendText('+');
    return _addButton;
  }

   ButtonElement _generateMinusButton() {
    _minusButton.id = 'remove';
    _minusButton.appendText('-');
    return _minusButton;
  }
}
