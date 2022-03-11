// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ksb_app/chopper_api/my_api_services.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/constants/palette.dart';
import 'package:ksb_app/notifiers/login_notifier.dart';
import 'package:ksb_app/notifiers/photos_notifier.dart';
import 'package:ksb_app/notifiers/work_sheet_notifier.dart';
import 'package:ksb_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => MyApiService.create()),
      ChangeNotifierProvider<WorkSheetNotifier>(
        create: (_) => WorkSheetNotifier(),
        lazy: true,
      ),
      ChangeNotifierProvider<PhotosNotifier>(
        create: (_) => PhotosNotifier(),
        lazy: true,
      ),
    ],
    builder: (context, child) {
      return ChangeNotifierProvider<LoginNotifier>(
        create: (_) => LoginNotifier(context.read),
        lazy: false,
        child: Builder(builder: (context) {
          return const MyApp();
        }),
      );
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: genTxt,
        ),
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(8.0),
            primary: Colors.white60,
            backgroundColor: colorPrimaryVariant,
            onSurface: primaryText,
            elevation: 3.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorPrimary,
          foregroundColor: colorBackground,
        ),
        scaffoldBackgroundColor: colorBackground,
      ),
      initialRoute: RouteManager.splash,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
