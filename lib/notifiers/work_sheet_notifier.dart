import 'package:flutter/material.dart';
import 'package:ksb_app/my_models/work_sheet.dart';

class WorkSheetNotifier extends ChangeNotifier {
  BuiltWorkSheet? currentWorkSheet;

  void updateWorkSheet(BuiltWorkSheet newWorkSheet) {
    currentWorkSheet = newWorkSheet;
  }

  void addSignatures(
      {required String clientSignature, required String engSignature}) {
    currentWorkSheet = currentWorkSheet!.rebuild(
      (b) => b
        ..clientSignatureString = clientSignature
        ..engSignatureString = engSignature,
    );
  }
}
