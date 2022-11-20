import 'package:flutter/material.dart';
import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab2/lab2_model.dart';

class Lab2Widget extends StatelessWidget {
  const Lab2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab2'),
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<Lab2Model>(context);
    if (model == null) return const SizedBox.shrink();
    model.initialization();

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: const [
          _TextFieldWidget(),
          _ShowResultsWidget(),
        ],
      ),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab2Model>(context);
    if (model == null) return const SizedBox.shrink();
    const textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Text',
          style: textStyle,
        ),
        const SizedBox(height: 6),
        TextField(
          onChanged: (value) => model.addSymbol(value),
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: model.isCorrect ? Colors.grey : Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: model.isCorrect ? Colors.grey : Colors.red),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(10)),
          autocorrect: false,
        ),
      ],
    );
  }
}

class _ShowResultsWidget extends StatelessWidget {
  const _ShowResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab2Model>(context);
    if (model == null) return const SizedBox.shrink();

    return ElevatedButton(
      onPressed: () => model.showTime(),
      child: const Text('Show time'),
    );
  }
}
