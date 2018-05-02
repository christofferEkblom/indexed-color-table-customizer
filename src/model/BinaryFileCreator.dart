import 'dart:typed_data';
import 'dart:html';

class BinaryFileCreator {
  static const String _FILE_NAME = 'untitled';
  static const String _FILE_EXTENSION = '.act';

  void downloadFile(Uint8List bytes) {
    AnchorElement link = new AnchorElement();
    link.href = Url.createObjectUrlFromBlob(new Blob([bytes]));
    link.download = _FILE_NAME + _FILE_EXTENSION;
    link.click();
  }
}
