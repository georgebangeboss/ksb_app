import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ksb_app/chopper_api/my_api_services.dart';
import 'package:ksb_app/constants/string_res.dart';
import 'package:ksb_app/my_models/work_sheet.dart';
import 'package:ksb_app/notifiers/photos_notifier.dart';
import 'package:ksb_app/notifiers/work_sheet_notifier.dart';
import 'package:ksb_app/routes/routes.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void createSnackBar({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

const Map<String, Function(BuildContext context, BuiltWorkSheet workSheet)>
    popupFunctions = {
  pushToDBFunction: pushToDB,
  proceedToSignaturesFunction: proceedToSignatures,
};

void pushToDB(BuildContext context, BuiltWorkSheet workSheet) async {
  List<http.MultipartFile> images = [];
  List<int> clientSignature = context.read<PhotosNotifier>().clientSigPic;
  List<int> engineerSignature = context.read<PhotosNotifier>().engineerSigPic;

  List<File> imageFiles = context.read<PhotosNotifier>().workSheetImages;
  if (imageFiles.isNotEmpty) {
    for (int i = 0; i < imageFiles.length; i++) {
      images.add(await http.MultipartFile.fromPath(
        'work_sheet_images',
        imageFiles[i].path,
      ));
    }
  }
  final workSheet = context.read<WorkSheetNotifier>().currentWorkSheet;
  var response =
      await Provider.of<MyApiService>(context, listen: false).postWorkSheet(
    images: images,
    report: workSheet!.report,
    recommendation: workSheet.recommendations,
    actionWorkRequired: workSheet.actionWork,
    arrivalTime: workSheet.arrivalTime,
    departureTime: workSheet.departureTime,
    vehicleReg: workSheet.numberPlate,
    startMileage: workSheet.startMileage,
    endMileage: workSheet.stopMileage,
    date: workSheet.departureTime,
    location: workSheet.siteLocation,
    department: workSheet.dept,
    jobNumber: workSheet.jobNumber!,
    clientSignature: workSheet.clientSignatureString!,
    engineerSignature: workSheet.engSignatureString!,
    clientRep: workSheet.clientRep,
    clientOrg: workSheet.clientOrg,
    engineer: workSheet.engineerName,
    manager: workSheet.managerName,
    timeSpent: workSheet.timeSpent,
    distanceCovered: workSheet.distanceCovered,
    clientSignatureImage: clientSignature,
    engineerSignatureImage: engineerSignature,
  );

  bool isSuccessful = response.isSuccessful;

  createSnackBar(context: context, text: 'Uploading...');

  // Navigator.popUntil(context, ModalRoute.withName(RouteManager.home));
  if (isSuccessful) {
    createSnackBar(context: context, text: 'Successfully uploaded pdf');
    Navigator.pop(context);
  } else {
    createSnackBar(context: context, text: 'Unsuccessful');
    Navigator.pop(context);
  }
}

void proceedToSignatures(BuildContext context,
    [BuiltWorkSheet? workSheet]) async {
  await Navigator.of(context).popAndPushNamed(RouteManager.signaturePage);
}
