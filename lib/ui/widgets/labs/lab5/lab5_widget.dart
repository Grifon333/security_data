import 'package:flutter/material.dart';
import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab5/lab5_model.dart';

class Lab5Widget extends StatelessWidget {
  const Lab5Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab5'),
      ),
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab5Model>(context);
    if (model == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => model.createSimpleNumber(),
            child: const Text('Generate'),
          ),
          const SizedBox(width: 20),
          Text(
            '${model.number ?? 0}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
