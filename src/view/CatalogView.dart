import 'dart:html';
import 'View.dart';

class CatalogView implements View {
  Map _data;
  DivElement _catalog;
  UListElement _ul;
  ButtonElement _closeButton;

  ButtonElement get closeButton => _closeButton;

  CatalogView() {
    _closeButton = new ButtonElement();
    _closeButton.id = 'closeCatalog';
    _closeButton.appendText("x");
  }

  void generate() {
    _catalog = new DivElement();
    _catalog.id = 'catalog';

    _ul = new UListElement();

    _data.forEach((k, v) => _addListObject(k)); 

    _catalog.append(_closeButton);
    _catalog.append(_ul);

    document.body.children.add(_catalog);
  }

  void show() {
    _catalog.style.display = 'block';
  }

  void hide() {
    _catalog.style.display = 'none';
  }

  void getData(Map data) {
    _data = data;
  }

  void _addListObject(String title) {
    LIElement li = new LIElement();
    li.appendText(title);
    _ul.append(li);
  }
}
