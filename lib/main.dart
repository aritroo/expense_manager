import 'package:flutter/material.dart';
import 'home.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Second App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.amber, error: Colors.redAccent),
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              titleTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                    titleLarge: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                    ),
                  )
                  .titleLarge),
        ),
        home: MyHomePage(),
      );
    });
  }
}
