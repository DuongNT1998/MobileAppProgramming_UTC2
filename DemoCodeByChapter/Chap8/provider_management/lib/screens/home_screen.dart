import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/counter_controller.dart';
import '../common/styles/app_text_styles.dart';
import '../common/widgets/custom_button.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterController controller =
    Provider.of<CounterController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Counter Value',
              style: AppTextStyles.title,
            ),

            const SizedBox(height: 16),

            Text(
              controller.counterValue.toString(),
              style: AppTextStyles.counterValue,
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: '-',
                  onPressed: () {
                    controller.decreaseCounter();
                  },
                ),

                const SizedBox(width: 16),

                CustomButton(
                  text: '+',
                  onPressed: () {
                    controller.increaseCounter();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
