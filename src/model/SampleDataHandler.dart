import 'dart:async';
import 'dart:convert';
import 'dart:html';

class SampleDataHandler {
  Future<Map> getJsonFile() async {
    String getPath = 'Sample table generator/Sample.json';
    HttpRequest request = new HttpRequest();
    request
      ..open('Get',getPath)
      ..setRequestHeader('Content-Type','application/json')
      ..send('');
    await request.onLoadEnd.first;
    return JSON.decode(request.responseText);
  }
}
