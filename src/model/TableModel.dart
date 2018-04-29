class TableModel {
  int _cols;
  int _rows;
  String _initialColor;

  int get cols => _cols;
  int get rows => _rows;
  String get initialColor => _initialColor;

  TableModel(int cols, int rows, String initialColor) {
    _cols = cols;
    _rows = rows;
    _initialColor = initialColor;
  }
}
