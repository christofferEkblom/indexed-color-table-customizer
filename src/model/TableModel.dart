abstract class TableModel {
  static const String DEFAULT_FILL_VALUE = "000000";
  static const int COLS = 16;
  static const int ROWS = 16;

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
    throw UnimplementedError;
  }
}
