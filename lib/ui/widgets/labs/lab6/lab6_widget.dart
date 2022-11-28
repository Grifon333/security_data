import 'package:flutter/material.dart';
import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab6/lab6_model.dart';

class Lab6Widget extends StatelessWidget {
  const Lab6Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<Lab6Model>(context);
    if (model == null) return const SizedBox.shrink();
    model.initialization();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab6'),
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
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          _TextFieldWidget(),
          SizedBox(height: 10),
          _ButtonsWidget(),
          SizedBox(height: 10),
          _ResultWidget(),
        ],
      ),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab6Model>(context);
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

class _ButtonsWidget extends StatelessWidget {
  const _ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab6Model>(context);
    if (model == null) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => model.encode(),
          child: const Text('Encode'),
        ),
        ElevatedButton(
          onPressed: () => model.decode(),
          child: const Text('Decode'),
        ),
      ],
    );
  }
}

class _ResultWidget extends StatelessWidget {
  const _ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab6Model>(context);
    if (model == null) return const SizedBox.shrink();

    return Text(
      model.result
    );
  }
}
