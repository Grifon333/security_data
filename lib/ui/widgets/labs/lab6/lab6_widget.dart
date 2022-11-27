import 'package:flutter/material.dart';
import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab6/lab6_model.dart';

class Lab6Widget extends StatelessWidget {
  const Lab6Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab6'),
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab6Model>(context);
    if (model == null) return const SizedBox.shrink();
    model.algorithmRSA();
    model.createEDS();

    return Column(
      children: [],
    );
  }
}
