import 'dart:typed_data';
import 'dart:html';

abstract class TableModel {
  static const String DEFAULT_FILL_VALUE = "000000";
  static const int COLS = 16;
  static const int ROWS = 16;

  static const int _COLOR_CHANNELS = 3;
  static const int _FILE_SIZE_IN_BYTES = 768;
  static const int _COLOR_CHANNEL_SIZE = 2;
  static const int _HEX_BASE = 16;

  static int _cursor = 1;

  static int get cursor => _cursor;

  static void increaseCursor() {
    if(cursor < COLS * ROWS) {
      ++_cursor;
    }
  }

  static void decreaseCursor() {
    if(cursor > 1) {
      --_cursor;
    }
  }

  static void createBinaryFile(List<String> data) {
    Uint8List arrayBuffer = new Uint8List(_FILE_SIZE_IN_BYTES);

    List<List<int>> bytes = _hexArrayToBytes(data);
    int pos = 0;

    for(int i = 0; i < bytes.length; i++) {
      for(int j = 0; j < 3; j++) {
        arrayBuffer[pos++] = bytes[i][j];
      }
    }

    while(pos < _FILE_SIZE_IN_BYTES) {
      arrayBuffer[pos++] = arrayBuffer[0];
      arrayBuffer[pos++] = arrayBuffer[1];
      arrayBuffer[pos++] = arrayBuffer[2];
    }
    
    Blob blob = new Blob([arrayBuffer]);
    String url = Url.createObjectUrlFromBlob(blob);
    AnchorElement link = new AnchorElement();
    link.href = url;
    link.download = "filename.ext";
    link.click();
  }

  static List<int> _hexStringToBytes(hex) {
    List<int> bytes = new List<int>();
    String colorChannel;

    for(int i = 0; i < _COLOR_CHANNELS; i++) {
      colorChannel = hex.substring(i * _COLOR_CHANNEL_SIZE, i * _COLOR_CHANNEL_SIZE + _COLOR_CHANNEL_SIZE);
      bytes.add(int.parse(colorChannel, radix: _HEX_BASE));
    }

    return bytes;
  }

  static List<List<int>> _hexArrayToBytes(List<String> hexArray) {
    List<List<int>> bytes = new List<List<int>>();

    for(int i = 0; i < hexArray.length; i++) {
      bytes.add(_hexStringToBytes(hexArray[i]));
    }

    return bytes;
  }
}
