import 'package:flutter/material.dart';
import 'package:cook_book_new/pages/home.dart';
import 'package:cook_book_new/pages/DarkThemePreference.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
    await themeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeProvider;
          })
        ],
        child: Consumer<DarkThemeProvider>(

            builder: (context, ThemeData, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'cook book',
                theme: Styles.themeData(themeProvider.darkTheme, context),
                home: Home(),
              );
            }
        ));
  }
}
