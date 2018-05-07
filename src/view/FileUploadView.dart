import 'dart:html';
import 'View.dart';

class FileUploadView implements View {
  InputElement _uploadButton;
  LabelElement _uploadButtonLabel;

  InputElement get uploadButton => _uploadButton;

  FileUploadView() {
    _uploadButton = new InputElement();
    _uploadButton.type = 'file';
    _uploadButtonLabel = new LabelElement();
  }

  void generate() {
    document.body.children.add(_generateUploadButtonLabel());
    _uploadButtonLabel.append(_generateUploadButton());
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
