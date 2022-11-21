import 'package:flutter/material.dart';
import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab3/lab3_model.dart';

class Lab3Widget extends StatelessWidget {
  const Lab3Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab3'),
      ),
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab3Model>(context);
    if (model == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          TextField(
            onChanged: (val) => model.codeMessage(val),
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                isCollapsed: true,
                contentPadding: EdgeInsets.all(10)),
            maxLines: 5,
          ),
          const SizedBox(height: 20),
          Text(model.codeMsg),
        ],
      ),
    );
  }
}
