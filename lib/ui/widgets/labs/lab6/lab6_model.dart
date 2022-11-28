import 'dart:math';

import 'package:flutter/cupertino.dart';

class Lab6Model extends ChangeNotifier {
  int p = 0;
  int q = 0;
  int n = 0;
  int f = 0;

  // close key
  int _d = 0;

  // open key
  int e = 0;
  late String _msg;
  late String _result;
  final controller = TextEditingController();

  // d: 125388283
  // e: 357461587
  // n: 272007821

  void initialization() {
    _msg = '';
    _result = '';
    _algorithmRSA();
    print('d: $_d');
    print('e: $e');
    print('n: $n');
  }

  void encode() {
    List<String> list = [];
    for (int i = 0; i < _msg.length; i++) {
      int hash = _msg[i].codeUnits.first;
      int sign = hash.modPow(_d, n);
      list.add(String.fromCharCode(sign));
    }
    _result = list.join();
    print(_result);
    notifyListeners();
  }

  void decode() {
    List<String> list = [];
    for (int i = 0; i < _msg.length; i++) {
      int hash = _msg[i].codeUnits.first;
      int sign = hash.modPow(e, n);
      list.add(String.fromCharCode(sign));
    }
    _result = list.join();
    print(_result);
    notifyListeners();
  }

  void _algorithmRSA() {
    p = _createSimpleNumber();
    q = _createSimpleNumber();
    n = p * q;
    f = (p - 1) * (q - 1);

    _d = _createSimpleNumber(max: f);
    while (_gst(f, _d) != 1) {
      _d++;
    }
    e = _createSimpleNumber(max: n);
    while ((e * _d) % f != 1) {
      e++;
    }
  }

  int _gst(int a, int b) {
    while (a != 0 && b != 0) {
      if (a > b) {
        a = a % b;
      } else {
        b = b % a;
      }
    }
    return a + b;
  }

  int _createSimpleNumber({int? max}) {
    final rand = Random();
    int m = max ?? 65536;
    int number = 0;
    bool isSimple = false;
    do {
      number = rand.nextInt(m);
      isSimple = _testMillerRabin(number, 100);
    } while (isSimple == false);
    return number;
  }

  bool _testMillerRabin(int n, int k) {
    final rand = Random();
    if (n == 2 || n == 3 || n == 5 || n == 7 || n == 11) {
      return true;
    }
    if (n % 2 == 0 ||
        n % 3 == 0 ||
        n % 5 == 0 ||
        n % 7 == 0 ||
        n % 11 == 0 ||
        n <= 3) {
      return false;
    }
    int d = n - 1;
    int s = 0;
    while (d % 2 == 0) {
      d ~/= 2;
      s++;
    }

    for (int i = 0; i < k; i++) {
      int a = 2 + rand.nextInt(n - 2);
      int x = a.modPow(d, n);
      if (x == 1 || x == n - 1) continue;
      for (int j = 0; j < s - 1; j++) {
        x = x.modPow(2, n);
        if (x == 1) {
          return false;
        }
        if (x == n - 1) break;
      }
      if (x == n - 1) {
        return false;
      }
    }

    return true;
  }

  void setMsg(String val) {
    _msg = val;
  }

  String get result => _result;

  void reset() {
    controller.clear();
    notifyListeners();
  }
}
