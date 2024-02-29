import 'package:flutter/material.dart';

class StateLessScreen extends StatelessWidget {
  StateLessScreen({super.key});

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    decoration: InputDecoration(
                      suffixIconColor: Colors.blue,
                      suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility
                            : Icons.visibility_off_sharp),
                      ),
                    ),
                    obscureText: toggle.value,
                  );
                },
              ),
              Center(
                child: ValueListenableBuilder(
                  builder: (context, value, child) {
                    return Text(
                      counter.value.toString(),
                      style: const TextStyle(fontSize: 40),
                    );
                  },
                  valueListenable: counter,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.value++;
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
