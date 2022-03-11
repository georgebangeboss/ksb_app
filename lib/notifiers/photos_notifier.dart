import 'dart:io';

import 'package:flutter/material.dart';

class PhotosNotifier extends ChangeNotifier {
  var workSheetImages = <File>[];
  List<int> clientSigPic = [];
  List<int> engineerSigPic = [];

  addImage(File file) {
    workSheetImages.add(file);
    notifyListeners();
  }

  removeImage(File file) {
    workSheetImages.remove(file);
    notifyListeners();
  }
}
