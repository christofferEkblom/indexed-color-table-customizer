import 'dart:html';
import 'View.dart';

class ToolPanelView implements View {
  DivElement _toolPanel;
  ButtonElement _plusButton;
  ButtonElement _minusButton;
  ButtonElement _downloadButton;
  ButtonElement _catalogButton;
  InputElement _uploadButton;
  LabelElement _uploadButtonLabel;

  ButtonElement get plusButton => _plusButton;
  ButtonElement get minusButton => _minusButton;
  ButtonElement get downloadButton => _downloadButton;
  ButtonElement get catalogButton => _catalogButton;
  InputElement get uploadButton => _uploadButton;

  ToolPanelView() {
    _toolPanel = new DivElement();
    _toolPanel.id = 'tool-panel';
    _plusButton = new ButtonElement();
    _minusButton = new ButtonElement();
    _downloadButton = new ButtonElement();
    _catalogButton = new ButtonElement();
    _uploadButton = new InputElement();
    _uploadButton.type = 'file';
    _uploadButtonLabel = new LabelElement();
  }

  void generate() {
    _toolPanel.append(_generatePlusButton());
    _toolPanel.append(_generateMinusButton());
    _toolPanel.append(_generateDownloadButton());
    _toolPanel.append(_generatecatalogButton());
    _toolPanel.append(_generateUploadButtonLabel());
    _uploadButtonLabel.append(_generateUploadButton());
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

  ButtonElement _generateDownloadButton() {
    _downloadButton.id = 'download';
    _downloadButton.appendText('↓');
    return _downloadButton;
  }

  ButtonElement _generatecatalogButton() {
    _catalogButton.id = 'browse';
    _catalogButton.appendText('Catalog');
    return _catalogButton;
  }

  InputElement _generateUploadButton() {
    _uploadButton.id = 'upload';
    _uploadButton.appendText('↑');
    return _uploadButton;
  }

  LabelElement _generateUploadButtonLabel() {
    SpanElement span = new SpanElement();
    span.appendText('Chose a file or drag or drag it here');
    _uploadButtonLabel.append(span);
    return _uploadButtonLabel;
  }
}
