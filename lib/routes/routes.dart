import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ksb_app/major_tabs/home.dart';
import 'package:ksb_app/major_tabs/login.dart';
import 'package:ksb_app/major_tabs/sigup.dart';
import 'package:ksb_app/major_tabs/splash.dart';
import 'package:ksb_app/major_tabs/work_sheet_page.dart';
import 'package:ksb_app/minor_tabs/add_task_page.dart';
import 'package:ksb_app/minor_tabs/add_task_popup.dart';
import 'package:ksb_app/minor_tabs/confirm_popup.dart';
import 'package:ksb_app/minor_tabs/photo_previews.dart';
import 'package:ksb_app/minor_tabs/signature_page.dart';
import 'package:ksb_app/my_models/job.dart';
import 'package:ksb_app/routes/hero_page_router.dart';

class RouteManager {
  static const String home = "/home";

  static const String logIn = "/login";

  static const String splash = "/";

  static const String signUp = "/signup";

  static const String workSheet = "/workSheet";

  static const String signaturePage = '/signaturePage';

  static const String singlePhotoPreview = '/singlePhotoPreview';

  static const String allPhotosPreview = '/allPhotosPreview';

  static const String confirmPopup = '/confirmPopup';

  static const String addTaskPage = '/addTaskPage';

  static const String addTaskPopup = '/addTaskPopup';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case confirmPopup:
        return HeroDialogRoute(
          builder: (context) {
            return ConfirmPopUp(popupStrings: args as List<String>);
          },
        );
      case addTaskPopup:
        return HeroDialogRoute(
          builder: (context) {
            return AddTaskPopup();
          },
        );
      case logIn:
        return MaterialPageRoute(builder: (context) => Login());
      case home:
        return MaterialPageRoute(
            builder: (context) => HomePage(
                  isManager: true,
                ));
      case splash:
        return MaterialPageRoute(builder: (context) => Splash());
      case allPhotosPreview:
        return MaterialPageRoute(builder: (context) => AllPhotosPreview());
      case signUp:
        return MaterialPageRoute(builder: (context) => SignUp());
      case addTaskPage:
        return MaterialPageRoute(builder: (context) => AddTaskPage());
      case singlePhotoPreview:
        return MaterialPageRoute(
            builder: (context) => SinglePhotoPreview(file: args as File));
      case signaturePage:
        return MaterialPageRoute(builder: (context) => SignaturePage());
      case workSheet:
        return MaterialPageRoute(
            builder: (context) => WorkSheetPage(
                  builtJob: args as BuiltJob,
                ));
      default:
        throw FormatException("Route does not exist");
    }
  }
}
