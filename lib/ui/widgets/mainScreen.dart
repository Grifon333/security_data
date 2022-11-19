import 'package:flutter/material.dart';
import 'package:security_data/theme/app_colors.dart';
import 'package:security_data/theme/app_text_style.dart';
import 'package:security_data/ui/navigation/main_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Security',
          style: AppTextStyle.title,
        ),
      ),
      body: const _ListLabsWidget(),
    );
  }
}

class _ListLabsWidget extends StatelessWidget {
  const _ListLabsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: const [
          _ListButtons(),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Text(
              '© KING',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListButtons extends StatelessWidget {
  const _ListButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = MainNavigation().routes.length - 1;
    const all = 8;

    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: ListView.builder(
        itemCount: all,
        itemExtent: 80,
        padding: const EdgeInsets.only(top: 30),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: index < count
                    ? MaterialStateProperty.all(AppColors.buttonBG)
                    : MaterialStateProperty.all(AppColors.buttonBG_disable),
              ),
              onPressed: index < count
                  ? () => Navigator.of(context).pushNamed('/lab${index + 1}')
                  : null,
              child: Text(
                'Lab ${index + 1}',
                style: AppTextStyle.labaLabel,
              ),
            ),
          );
        },
      ),
    );
  }
}
