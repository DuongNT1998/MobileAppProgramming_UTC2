import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../controllers/counter_controller.dart';
import '../common/styles/app_text_style.dart';
import '../common/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScopedModel Counter'),
      ),
      body: Center(
        child: ScopedModelDescendant<CounterController>(
          builder: (context, child, model) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.counterValue.toString(),
                  style: AppTextStyle.counterText,
                ),
                SizedBox(height: 20),
                PrimaryButton(
                  text: 'Tăng',
                  onPressed: () {
                    model.increase();
                  },
                ),
                SizedBox(height: 10),
                PrimaryButton(
                  text: 'Giảm',
                  onPressed: () {
                    model.decrease();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
