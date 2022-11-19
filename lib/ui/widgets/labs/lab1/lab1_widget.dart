import 'package:flutter/material.dart';
import 'package:security_data/library/widgets/inherited/provider.dart';
import 'package:security_data/ui/widgets/labs/lab1/lab1_model.dart';

class Lab1Widget extends StatelessWidget {
  const Lab1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab1'),
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<Lab1Model>(context);
    if (model == null) return const SizedBox.shrink();

    const textStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
    // model.encode('парастаоля');

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TextFieldWidget(
            label: 'Login',
            isCorrect: model.error != IncorrectData.login,
            onChange: (val) => model.enterLogin = val ?? '',
          ),
          const SizedBox(height: 10),
          _TextFieldWidget(
            label: 'Password',
            isCorrect: model.error != IncorrectData.password,
            isObscure: true,
            onChange: (val) => model.enterPassword = val ?? '',
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  const style = TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  );
                  const color = Colors.redAccent;
                  model.check();
                  if (model.error == IncorrectData.password) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Invalid password. Try again',
                          style: style,
                        ),
                        backgroundColor: color,
                      ),
                    );
                  } else if (model.error == IncorrectData.login) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Account not found. Try again',
                          style: style,
                        ),
                        backgroundColor: color,
                      ),
                    );
                  }
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 20),
              model.error == IncorrectData.none
                  ? const Icon(
                      Icons.done_outline,
                      color: Colors.green,
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ],
      ),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  final String label;
  final bool isCorrect;
  final bool isObscure;
  final Function(String?) onChange;

  const _TextFieldWidget({
    Key? key,
    required this.label,
    required this.isCorrect,
    required this.onChange,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyle,
        ),
        const SizedBox(height: 6),
        TextField(
          onChanged: (value) => onChange(value),
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide:
                    BorderSide(color: isCorrect ? Colors.grey : Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide:
                    BorderSide(color: isCorrect ? Colors.grey : Colors.red),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(10)),
          obscureText: isObscure,
          autocorrect: !isObscure,
        ),
      ],
    );
  }
}
