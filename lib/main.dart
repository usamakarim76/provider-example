import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_1/Provider/auth_provider.dart';
import 'package:provider_example_1/Provider/favourite_provider.dart';
import 'package:provider_example_1/Provider/number_change_provider.dart';
import 'package:provider_example_1/Provider/slider_provider.dart';
import 'package:provider_example_1/Provider/theme_provider.dart';
import 'package:provider_example_1/Screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderExample()),
        ChangeNotifierProvider(create: (_) => ChangeNumber()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => FavouriteItems()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(builder: (context) {
        final theme = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: theme.themeMode,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            // useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark
          ),
          home: const MainScreen(),
        );
      },),
    );
  }
}
