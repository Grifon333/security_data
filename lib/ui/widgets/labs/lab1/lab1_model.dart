import 'package:flutter/material.dart';

enum IncorrectData { password, login, none }

class Lab1Model extends ChangeNotifier {
  final matrix = [
    ['ш', 'и', 'к', 'у', 'н'],
    ['а', 'б', 'в', 'г', 'д'],
    ['е', 'є', 'ж', 'з', 'і'],
    ['ї', 'й', 'л', 'м', 'о'],
    ['п', 'р', 'с', 'т', 'ф'],
    ['х', 'ц', 'ч', 'щ', 'ь'],
    ['ю', 'я', 'ʼ', '.', '_']
  ];
  final _login = 'шишкун';
  final _password = 'хепбтфдїйʼ';
  String enterLogin = '';
  String enterPassword = '';
  IncorrectData? error;

  String encode(String msg) {
    final listChars = msg.split('');
    for (int i = 1; i < listChars.length; i++) {
      if (listChars[i] == listChars[i - 1]) {
        listChars.insert(i, 'ʼ');
      }
    }
    if (listChars.length % 2 != 0) {
      listChars.add('ʼ');
    }

    for (int k = 0; k < listChars.length; k += 2) {
      int x1 = -1, x2 = -1;
      int y1 = -1, y2 = -1;
      for (int i = 0; i < matrix.length; i++) {
        for (int j = 0; j < matrix[i].length; j++) {
          if (x1 == -1 && matrix[i][j] == listChars[k]) {
            x1 = j;
            y1 = i;
          }
          if (x2 == -1 && matrix[i][j] == listChars[k + 1]) {
            x2 = j;
            y2 = i;
          }
        }
      }

      if (x1 == x2) {
        if (y1 == 6) {
          y1 = 0;
          y2++;
        } else if (y2 == 6) {
          y2 = 0;
          y1++;
        } else {
          y1++;
          y2++;
        }
      } else if (y1 == y2) {
        if (x1 == 4) {
          x1 = 0;
          x2++;
        } else if (x2 == 4) {
          x2 = 0;
          x1++;
        } else {
          x1++;
          x2++;
        }
      } else {
        int t = x1;
        x1 = x2;
        x2 = t;
      }
      listChars[k] = matrix[y1][x1];
      listChars[k + 1] = matrix[y2][x2];
    }

    notifyListeners();
    return listChars.join();
  }

  void check() {
    final encodePassword = encode(enterPassword.trim());
    if (enterLogin != _login) {
      error = IncorrectData.login;
      return;
    } else if (encodePassword != _password) {
      error = IncorrectData.password;
      return;
    } else {
      error = IncorrectData.none;
    }
  }
}
