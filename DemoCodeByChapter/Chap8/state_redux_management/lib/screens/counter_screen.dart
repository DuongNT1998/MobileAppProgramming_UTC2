import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../controllers/app_state.dart';
import '../controllers/counter_actions.dart';
import '../common/widgets/primary_button.dart';
import '../common/styles/app_text_styles.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux Counter'),
      ),
      body: Center(
        child: StoreConnector<AppState, int>(
          converter: (store) {
            return store.state.counterState.value;
          },
          builder: (context, counterValue) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Giá trị hiện tại:',
                  style: AppTextStyle.title,
                ),
                const SizedBox(height: 10),
                Text(
                  counterValue.toString(),
                  style: AppTextStyle.counter,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: 'Tăng',
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(IncrementAction());
                      },
                    ),
                    const SizedBox(width: 20),
                    PrimaryButton(
                      text: 'Giảm',
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(DecrementAction());
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
