import 'dart:math';

import 'package:flutter/cupertino.dart';

class Lab6Model extends ChangeNotifier {
  int p = 0;
  int q = 0;
  int n = 0;
  int f = 0;
  int e = 0;
  int d = 0;
  int mcd = 0;
  String msg = 'Hello';

  String createEDS() {
    List<String> decodeMsg = [];
    for(int i = 0; i < msg.length; i++) {
      int hash = msg[i].hashCode;
      int sign = modPow(hash, d, n);
      int decodeSign = modPow(sign, e, n);
      decodeMsg.add(String.fromCharCode(decodeSign));
      // print(decodeMsg);
      print('sign: $sign');
      print('decodeSign: $decodeSign');
    }
    return decodeMsg.join();
  }

  void algorithmRSA() {
    p = createSimpleNumber();
    q = createSimpleNumber();

    n = p * q;
    f = (p - 1) * (q - 1);

    e = createSimpleNumber(max: n);
    if (euclid() || mcd != 1) {
      e++;
    }
    // while (euclid() || mcd != 1) {
    //   e++;
    //   print(e);
    // }
  }

  bool euclid() {
    int x1 = 1, x2 = 0, x3 = f;
    int y1 = 0, y2 = 1, y3 = e;
    while (y3 != 1) {
      if (y3 == 0) {
        mcd = x3;
        return false;
      }
      int q = x3 ~/ y3;
      int t1 = x1 - q * y1;
      int t2 = x2 - q * y2;
      int t3 = x3 - q * y3;
      x1 = y1;
      x2 = y2;
      x3 = y3;
      y1 = t1;
      y2 = t2;
      y3 = t3;
    }
    mcd = y3;
    d = y2;
    if (y2 < 0) {
      d += f;
    }
    return true;
  }

  int createSimpleNumber({int? max}) {
    final rand = Random();
    BigInt m = BigInt.from(max ?? 256);
    int number = 0;
    bool isSimple = false;
    do {
      number = rand.nextInt(m.toInt());
      isSimple = testMillerRabin(number, 1000);
    } while (isSimple == false);
    return number;
    // notifyListeners();
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
    // int d = 1;
    // List<int> bytes = intToBytes(b);
    // for (int i = bytes.length - 1; i >= 0; i--) {
    //   d = (d * d) % n;
    //   if (bytes[i] == 1) {
    //     d = (d * a) % n;
    //   }
    // }
    // return d;

    return a.modPow(b, n);
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
