import 'package:flutter/cupertino.dart';

class Lab4Model extends ChangeNotifier {
  String _codeMsg = '';
  final _key = 'шишкун';
  String alphabet = 'абвгґдеєжзиіїйклмнопрстуфхцчшщьюяʼ ';
  String result = '';
  final controller = TextEditingController();

  void encodeMessage() {
    _codeMsg = _codeMsg.toLowerCase();
    List<String> resultList = [];
    List<int> msgByInt = [];
    List<int> keyByInt = [];

    for (int i = 0, j = 0;
        i < _codeMsg.length;
        i++, j = (j + 1) % _key.length) {
      msgByInt.add(symbolToInt(_codeMsg[i]));
      keyByInt.add(symbolToInt(_key[j]));
    }

    for (int i = 0; i < keyByInt.length; i++) {
      int sum = (msgByInt[i] + keyByInt[i]) % alphabet.length;
      resultList.add(intToSymbol(sum));
    }

    result = resultList.join();
    notifyListeners();
  }

  void decodeMessage() {
    _codeMsg = _codeMsg.toLowerCase();
    List<String> resultList = [];
    List<int> msgByInt = [];
    List<int> keyByInt = [];

    for (int i = 0, j = 0;
        i < _codeMsg.length;
        i++, j = (j + 1) % _key.length) {
      msgByInt.add(symbolToInt(_codeMsg[i]));
      keyByInt.add(alphabet.length - symbolToInt(_key[j]));
    }

    for (int i = 0; i < keyByInt.length; i++) {
      int sum = (msgByInt[i] + keyByInt[i]) % alphabet.length;
      resultList.add(intToSymbol(sum));
    }

    result = resultList.join();
    notifyListeners();
  }

  int symbolToInt(String char) {
    return alphabet.indexOf(char);
  }

  String intToSymbol(int pos) {
    return alphabet[pos];
  }

  void setMsg(String val) {
    _codeMsg = val;
    notifyListeners();
  }

  String get codeMsg => _codeMsg;

  void reset() {
    controller.clear();
    notifyListeners();
  }
}
