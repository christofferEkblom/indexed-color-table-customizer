import 'dart:typed_data';
import 'dart:html';
import 'TableDataHandler.dart';
import 'exception/InvalidFileSizeException.dart';

class BinaryFileCreator {
  static const String _FILE_NAME = 'untitled';
  static const String _FILE_EXTENSION = '.act';

  void downloadFile(Uint8List bytes) {
    AnchorElement link = new AnchorElement();
    link.href = Url.createObjectUrlFromBlob(new Blob([bytes]));
    link.download = _FILE_NAME + _FILE_EXTENSION;
    link.click();
  }

  void uploadFile(InputElement input) {
    File file = input.files[0];

    if(file.size != TableDataHandler.FILE_SIZE_IN_BYTES) {
      throw new InvalidFileSizeException();
    }

    Blob blob = file.slice(0, TableDataHandler.FILE_SIZE_IN_BYTES);
    FileReader reader = new FileReader();
    List<int> bytes;

    reader.onLoad.first.then((_) {
      bytes = reader.result;
      print(bytes);
      throw new UnimplementedError();
    });

    reader.onError.first.then((error) {
      throw new Exception();
    });

    reader.readAsArrayBuffer(blob);
  }
}
