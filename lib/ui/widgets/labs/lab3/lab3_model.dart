import 'package:flutter/cupertino.dart';

class Lab3Model extends ChangeNotifier {
  final List<List<int>> matrix = [
    [11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
    [10, 37, 36, 33, 32, 29, 28, 25, 24, 21],
    [9, 38, 35, 34, 31, 30, 27, 26, 23, 22],
    [8, 39, 49, 41, 42, 43, 44, 45, 46, 47],
    [7, 6, 5, 4, 3, 2, 1, 0, 49, 48],
    [68, 67, 66, 65, 64, 63, 62, 61, 50, 51],
    [69, 76, 77, 84, 85, 92, 93, 60, 59, 52],
    [70, 75, 78, 83, 86, 91, 94, 99, 58, 53],
    [71, 74, 79, 82, 87, 90, 95, 98, 57, 54],
    [72, 73, 80, 81, 88, 89, 96, 97, 56, 55],
  ];

  String _codeMsg = '';

  void codeMessage(String msg) {
    int add = msg.length % 100;
    add = 100 - add;
    List<String> list = msg.split('');
    list.addAll(List.filled(add, '#'));
    int n = list.length ~/ 100;
    List<String> result = [];
    for (int k = 0; k < n; k++) {
      for (int i = 0; i < matrix.length; i++) {
        for (int j = 0; j < matrix[i].length; j++) {
          String char = list[matrix[i][j] + 100 * k];
          if (char == '#') continue;
          result.add(char);
        }
      }
    }
    _codeMsg = result.join();
    notifyListeners();
  }

  get codeMsg => _codeMsg;
}
