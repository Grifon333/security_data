import 'dart:math';

import 'package:flutter/cupertino.dart';

class Lab7Model extends ChangeNotifier {
  String greatCode =
      'class Lab7Model extends ChangeNotifier {\n'
      '  void method() {\n'
      '    int balance = 8; /*balance*/\n'
      '    do {\n'
      '      /*start loop do-while*/\n'
      '      print(\'balance = \$balance\'); // show balance\n'
      '      // change for keeping subtracted value\n'
      '      int removal = Random().nextInt(1000000) % 3;\n'
      '      // show subtracted value\n'
      '      print(\'removal = \$removal\');\n'
      '      balance -= removal; // condition control\n'
      '    } while (balance > 0);\n'
      '    return;\n'
      '  }\n'
      '}';
  String uglyCode =
      'class Lab7Model extends ChangeNotifier{void method(){int sdfvr9tbs=0x19-0x14+4;int _tewh4326g=0x4F-0x33;/*balance*/do {/*start loop do-while*/print(\'balance = \$sdfvr9tbs\');/*show balance*//*change for keeping subtracted value*/int fgjdfwej3r2=Random().nextInt(0x3D090+790000-0x9C40)%(0xFA-0xF7);fgjdfwej3r2=fgjdfwej3r2*(21+0x4)~/(15+0xa);/*show subtracted value*/print(\'removal = \$fgjdfwej3r2\');if(sdfvr9tbs==0x9B1){_tewh4326g=_tewh4326g+sdfvr9tbs-0x52;}sdfvr9tbs-=fgjdfwej3r2;/*condition control*/}while(sdfvr9tbs>(11+0x5A-0x65)&&_tewh4326g==0x1C);return;}}';

  void method() {
    int balance = 8; /*balance*/
    do {
      /*start loop do-while*/
      print('balance = $balance'); // show balance
      // change for keeping subtracted value
      int removal = Random().nextInt(1000000) % 3;
      // show subtracted value
      print('removal = $removal');
      balance -= removal; // condition control
    } while (balance > 0);
    return;
  }
}
