import 'dart:html';
import 'View.dart';

class ToolPanelView implements View {
  DivElement _toolPanel;
  ButtonElement _plusButton;
  ButtonElement _minusButton;
  ButtonElement _downloadButton;
  ButtonElement _catalogButton;

  ButtonElement get plusButton => _plusButton;
  ButtonElement get minusButton => _minusButton;
  ButtonElement get downloadButton => _downloadButton;
  ButtonElement get catalogButton => _catalogButton;

  ToolPanelView() {
    _toolPanel = new DivElement();
    _toolPanel.id = 'tool-panel';
    _toolPanel.classes.add('btn-group');
    _plusButton = new ButtonElement();
    _minusButton = new ButtonElement();
    _downloadButton = new ButtonElement();
    _catalogButton = new ButtonElement();
  }

  void generate() {
    _toolPanel.append(_generatePlusButton());
    _toolPanel.append(_generateMinusButton());
    _toolPanel.append(_generateDownloadButton());
    _toolPanel.append(_generatecatalogButton());
    document.body.children.add(_toolPanel);
  }

  ButtonElement _generatePlusButton() {
    _plusButton.id = 'add';
    _plusButton.classes.add('btn');
    _plusButton.classes.add('btn-primary');
    _plusButton.appendText('+');
    return _plusButton;
  }

   ButtonElement _generateMinusButton() {
    _minusButton.id = 'remove';
    _minusButton.classes.add('btn');
    _minusButton.classes.add('btn-primary');
    _minusButton.appendText('-');
    return _minusButton;
  }

  ButtonElement _generateDownloadButton() {
    _downloadButton.id = 'download';
    _downloadButton.classes.add('btn');
    _downloadButton.classes.add('btn-primary');
    _downloadButton.appendText('↓');
    return _downloadButton;
  }

  ButtonElement _generatecatalogButton() {
    _catalogButton.id = 'browse';
    _catalogButton.classes.add('btn');
    _catalogButton.classes.add('btn-primary');
    _catalogButton.appendText('Catalog');
    return _catalogButton;
  }
}
