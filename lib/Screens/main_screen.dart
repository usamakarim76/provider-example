import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_1/Provider/number_change_provider.dart';
import 'package:provider_example_1/Provider/slider_provider.dart';
import 'package:provider_example_1/Provider/theme_provider.dart';
import 'package:provider_example_1/Screens/Favorates/favourite_screen.dart';
import 'package:provider_example_1/Screens/login_screen.dart';
import 'package:provider_example_1/Screens/stateless_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeNumber>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main Screen"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StateLessScreen()));
                },
                child: const Text("StateLess")),ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text("Login")),
            Consumer<ThemeChanger>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    RadioListTile<ThemeMode>(
                        title: const Text("Light Mode"),
                        value: ThemeMode.light,
                        groupValue: value.themeMode,
                        onChanged: value.setTheme),
                    RadioListTile<ThemeMode>(
                        title: const Text("Dark Mode"),
                        value: ThemeMode.dark,
                        groupValue: value.themeMode,
                        onChanged: value.setTheme),
                  ],
                );
              },
            ),
            Consumer<ProviderExample>(
              builder: (context, value, child) {
                return Slider(
                    min: 0,
                    max: 1.0,
                    value: value.value,
                    onChanged: (val) {
                      value.setVal(val);
                    });
              },
            ),
            Consumer<ProviderExample>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(value.value),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent.withOpacity(value.value),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Consumer<ChangeNumber>(
              builder: (context, value, child) {
                return Text("Number ${value.num.toString()}");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavouriteScreen()));
                },
                child: const Text("Next Page")),
          ],
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "add",
              onPressed: () {
                provider.setCount();
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
                heroTag: "sub",
                onPressed: () {
                  provider.decCount();
                },
                child: const Icon(Icons.remove)),
            FloatingActionButton(
                heroTag: "reset",
                onPressed: () {
                  provider.resetCount();
                },
                child: const Icon(Icons.restart_alt)),
          ],
        ));
  }
}
