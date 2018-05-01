import 'dart:html';
import 'View.dart';

class ToolPanelView implements View {
  DivElement _toolPanel;

  ToolPanelView() {
    _toolPanel = new DivElement();
    _toolPanel.id = 'tool-panel';
  }

  void generate() {
    document.body.children.add(_toolPanel);
  }
}
