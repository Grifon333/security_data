import 'dart:math';

import 'package:flutter/cupertino.dart';

class Lab2Model extends ChangeNotifier {
  String text =
      'Ступінь звʼязності набору, кількість похибок при введенні тексту';
  List<String> words = [
    'Ступінь',
    'звʼязності',
    'набору',
    'кількість',
    'похибок',
    'при',
    'введенні',
    'тексту'
  ];

  late List<List<int>> timeSymbols;
  late List<int> timeWords;
  late int timeText;
  int iPos = 0, jPos = 0;
  late Stopwatch timeAll;
  late Stopwatch timeWord;
  late Stopwatch timeSymbol;
  bool isCorrect = true;
  int lengthEnterString = 0;
  bool _readOnly = true;
  List<String> result = [];

  final textController = TextEditingController();

  void initialization() {
    timeAll = Stopwatch()..start();
    timeWord = Stopwatch()..start();
    timeSymbol = Stopwatch()..start();

    timeSymbols = List.generate(
      words.length,
      (index) => List.filled(words[index].length, 0),
    );
    timeWords = List.filled(words.length, 0);
    timeText = 0;
    iPos = 0;
    jPos = 0;

    isCorrect = true;
    lengthEnterString = 0;
    _readOnly = false;
    result.clear();
  }

  void addSymbol(String str) {
    if (str.length <= lengthEnterString) {
      if (jPos > 0) {
        jPos--;
      } else if (iPos > 0) {
        iPos--;
        jPos = words[iPos].length - 1;
      }
      lengthEnterString = str.length;

      isCorrect =
          text.contains(str) && str.characters.last == text[str.length - 1];
      notifyListeners();
      return;
    }
    if (str == text) {
      timeAll.stop();
      timeText = timeAll.elapsedMilliseconds;
      timeWord.stop();
      int t = timeWord.elapsedMilliseconds;
      timeWords[iPos] = t;
      calculateAllData();
      _readOnly = true;
    }
    lengthEnterString = str.length;
    String char = str.characters.last;

    if (checkChar(char)) {
      if (char == words[iPos].split('')[jPos]) {
        timeSymbol.stop();
        int t = timeSymbol.elapsedMilliseconds;
        timeSymbols[iPos][jPos] = t;
        timeSymbol = Stopwatch()..start();
      }
      if (jPos + 1 < words[iPos].length) {
        jPos++;
      }
    } else if (char.codeUnits.first == 32) {
      timeWord.stop();
      int t = timeWord.elapsedMilliseconds;
      timeWords[iPos] = t;
      jPos = 0;
      timeWord = Stopwatch()..start();
      if (iPos + 1 < words.length) {
        iPos++;
      }
    }
    isCorrect =
        text.contains(str) && str.characters.last == text[str.length - 1];

    // if (checkChar(char) && char == words[iPos].split('')[jPos]) {
    //   timeSymbol.stop();
    //   int t = timeSymbol.elapsedMilliseconds;
    //   timeSymbols[iPos][jPos++] = t;
    //   timeSymbol = Stopwatch()..start();
    //   isCorrect = true;
    // } else if (char.codeUnits.first == 32) {
    //   iPos++;
    //   jPos = 0;
    // } else if (checkChar(char) && char != words[iPos].split('')[jPos]) {
    //   jPos++;
    //   isCorrect = false;
    // }

    notifyListeners();
  }

  bool checkChar(String char) {
    int code = char.codeUnits.first;
    if (code == 700 ||
        code == 1028 ||
        code == 1030 ||
        code == 1031 ||
        (code >= 1040 && code <= 1103) ||
        code == 1108 ||
        code == 1110 ||
        code == 1111 ||
        code == 1168 ||
        code == 1169) {
      return true;
    }
    return false;
  }

  void showTime() {
    for (List<int> w in timeSymbols) {
      print(w);
    }
    print('');
    print(timeWords);
    print('');
    print(timeText);
  }

  void calculateAllData() {
    int n = text.length;
    double Tm, Tp, S = 0;
    List<double> Ts;
    double sum = 0;

    Tm = timeText / n;

    Ts = List.filled(words.length, 0);
    for (int i = 0; i < words.length; i++) {
      Ts[i] = timeWords[i] / words[i].length;
    }

    sum = 0;
    for (int i = 0; i < words.length; i++) {
      sum += timeWords[i];
    }
    Tp = (timeText - sum) / words.length;

    sum = 0;
    for (int i = 0; i < timeWords.length; i++) {
      sum += timeWords[i];
    }
    double M = sum / n;
    double k = 0;
    for (int i = 0; i < timeSymbols.length; i++) {
      for (int j = 0; j < timeSymbols[i].length; j++) {
        S += sqrt((timeSymbols[i][j] - M) * (timeSymbols[i][j] - M) / (n - 1));
        k++;
      }
    }
    S /= k;

    result.clear();
    result.add('Input speed: \n${round(Tm)}');
    result.add('Speed of entering each word: \n${Ts.map((e) => round(e))}');
    result.add('Average time interval between words: \n${round(Tp)}');
    result.add('Degree of coherence of the set: \n${round(S)}');
    notifyListeners();

    print('Tm: $Tm');
    print('Ts: $Ts');
    print('Tp: $Tp');
    print('S: $S');
  }

  void start() {
    initialization();
    textController.clear();
    notifyListeners();
  }

  void end() {
    textController.clear();
    notifyListeners();
  }

  get readOnly => _readOnly;

  double round(double value) {
    return (value * 1000).roundToDouble() / 1000;
  }
}
