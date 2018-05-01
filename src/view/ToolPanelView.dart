import 'dart:html';
import 'View.dart';

class ToolPanelView implements View {
  DivElement _toolPanel;
  ButtonElement _plusButton;
  ButtonElement _minusButton;

  ButtonElement get plusButton => _plusButton;
  ButtonElement get minusButton => _minusButton;

  ToolPanelView() {
    _toolPanel = new DivElement();
    _toolPanel.id = 'tool-panel';
    _plusButton = new ButtonElement();
    _minusButton = new ButtonElement();
  }

  void generate() {
    _toolPanel.append(_generatePlusButton());
    _toolPanel.append(_generateMinusButton());
    document.body.children.add(_toolPanel);
  }

  ButtonElement _generatePlusButton() {
    _plusButton.id = 'add';
    _plusButton.appendText('+');
    return _plusButton;
  }

   ButtonElement _generateMinusButton() {
    _minusButton.id = 'remove';
    _minusButton.appendText('-');
    return _minusButton;
  }
}
