import 'package:flutter/material.dart';
import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab4/lab4_model.dart';

class Lab4Widget extends StatelessWidget {
  const Lab4Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<Lab4Model>(context);
    if (model == null) return const SizedBox.shrink();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab4'),
        actions: [
          IconButton(
            onPressed: () => model.reset(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: const [
          _TextFieldWidget(),
          SizedBox(height: 10),
          _ShowResultWidget(),
        ],
      ),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab4Model>(context);
    if (model == null) return const SizedBox.shrink();

    return TextField(
      controller: model.controller,
      onChanged: (val) => model.setMsg(val),
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
    );
  }
}

class _ShowResultWidget extends StatelessWidget {
  const _ShowResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab4Model>(context);
    if (model == null) return const SizedBox.shrink();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => model.encodeMessage(),
              child: const Text('Encode'),
            ),
            ElevatedButton(
              onPressed: () => model.decodeMessage(),
              child: const Text('Decode'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        model.result.isNotEmpty
            ? Text(
                model.result,
                style: const TextStyle(fontSize: 16),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
