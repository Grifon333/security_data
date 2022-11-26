import 'dart:math';

import 'package:flutter/cupertino.dart';

class Lab5Model extends ChangeNotifier {
  int? number;

  void createSimpleNumber() {
    final rand = Random();
    bool isSimple = false;
    do {
      number = rand.nextInt(4294967295);
      isSimple = testMillerRabin(number ?? 0, 1000);
    } while (isSimple == false);
    notifyListeners();
  }

  bool testMillerRabin(int n, int k) {
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
      int x = modPow(a, d, n);
      if (x == 1 || x == n - 1) continue;
      for (int j = 0; j < s - 1; j++) {
        x = modPow(x, 2, n);
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

  int modPow(int a, int b, int n) {
    int d = 1;
    List<int> bytes = intToBytes(b);
    for (int i = bytes.length - 1; i >= 0; i--) {
      d = (d * d) % n;
      if (bytes[i] == 1) {
        d = (d * a) % n;
      }
    }
    return d;
  }

  List<int> intToBytes(int n) {
    List<int> bytes = [];
    while (n >= 1) {
      bytes.add(n % 2);
      n ~/= 2;
    }
    return bytes.reversed.toList();
  }
}
