import 'dart:typed_data';

class ColorTable {
  static const String DEFAULT_FILL_VALUE = "000000";
  static const int COLS = 16;
  static const int ROWS = 16;

  static const int _COLOR_CHANNELS = 3;
  static const int _FILE_SIZE_IN_BYTES = 768;
  static const int _COLOR_CHANNEL_SIZE = 2;
  static const int _HEX_BASE = 16;

  int _cursor = 1;
  Uint8List _arrayBuffer;
  List<String> _data;
  int get cursor => _cursor;

  ColorTable() {
    _arrayBuffer = new Uint8List(_FILE_SIZE_IN_BYTES);
  }

  void increaseCursor() {
    if(cursor < COLS * ROWS) {
      ++_cursor;
    }
  }

  void decreaseCursor() {
    if(cursor > 1) {
      --_cursor;
    }
  }

  Uint8List getBytes(List<String> data) {
    _data = data;
    _fillBytes();
    _replaceNullBytes();
    return _arrayBuffer;
  }

  List<int> _hexStringToBytes(hex) {
    List<int> bytes = new List<int>();
    String colorChannel;
    int start;
    int end;

    for(int i = 0; i < _COLOR_CHANNELS; i++) {
      start = i * _COLOR_CHANNEL_SIZE;
      end = i * _COLOR_CHANNEL_SIZE + _COLOR_CHANNEL_SIZE;
      colorChannel = hex.substring(start, end);
      bytes.add(int.parse(colorChannel, radix: _HEX_BASE));
    }

    return bytes;
  }

  List<List<int>> _hexArrayToBytes(List<String> hexArray) {
    List<List<int>> bytes = new List<List<int>>();

    for(int i = 0; i < hexArray.length; i++) {
      bytes.add(_hexStringToBytes(hexArray[i]));
    }

    return bytes;
  }

  void _fillBytes() {
    List<List<int>> bytes = _hexArrayToBytes(_data);
    int pos = 0;

    for(int i = 0; i < bytes.length; i++) {
      for(int j = 0; j < 3; j++) {
        _arrayBuffer[pos++] = bytes[i][j];
      }
    }
  }

  void _replaceNullBytes() {
    int pos = _cursor * _COLOR_CHANNELS;

    while(pos < _FILE_SIZE_IN_BYTES) {
      _arrayBuffer[pos++] = _arrayBuffer[0];
      _arrayBuffer[pos++] = _arrayBuffer[1];
      _arrayBuffer[pos++] = _arrayBuffer[2];
    }
  }
}
