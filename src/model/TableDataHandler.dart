import 'dart:typed_data';

class TableDataHandler {
  static const String DEFAULT_FILL_VALUE = "000000";
  static const int COLS = 16;
  static const int ROWS = 16;
  
  static const int _COLOR_CHANNELS = 3;
  static const int FILE_SIZE_IN_BYTES = 768;
  static const int _COLOR_CHANNEL_SIZE = 2;
  static const int _HEX_BASE = 16;

  int _cursor = 1;
  int _pos = 0;
  Uint8List _arrayBuffer;
  List<String> _data;

  int get cursor => _cursor;

  TableDataHandler() {
    _arrayBuffer = new Uint8List(FILE_SIZE_IN_BYTES);
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

  void setCursorAtTheEnd() {
    _cursor = COLS * ROWS;
  }

  List<String> bytesToHexList(List<int> bytes) {
    final result = bytes.map((b) => '${b.toRadixString(16).padLeft(2, '0')}');
    String str = '';
    String separator = ',';
    int pos = 0;
    result.forEach((byte) => str += byte + (++pos % 3 == 0 ? separator : ''));
    str = str.substring(0, str.length - 1);
    return str.split(separator);
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

    for(int i = 0; i < bytes.length; i++) {
      for(int j = 0; j < 3; j++) {
        _arrayBuffer[_pos++] = bytes[i][j];
      }
    }
  }

  void _replaceNullBytes() {
    while(_pos < FILE_SIZE_IN_BYTES) {
      _arrayBuffer[_pos++] = _arrayBuffer[0];
      _arrayBuffer[_pos++] = _arrayBuffer[1];
      _arrayBuffer[_pos++] = _arrayBuffer[2];
    }
  }
}
