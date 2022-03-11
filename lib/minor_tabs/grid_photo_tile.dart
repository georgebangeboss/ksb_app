import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/constants/palette.dart';
import 'package:ksb_app/constants/string_res.dart';
import 'package:ksb_app/notifiers/photos_notifier.dart';
import 'package:ksb_app/routes/routes.dart';
import 'package:provider/provider.dart';

class GridPhotoTile extends StatelessWidget {
  final File file;
  final bool isFourthImage;
  const GridPhotoTile(
      {Key? key, required this.file, this.isFourthImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isFourthImage) {
          Navigator.of(context).pushNamed(RouteManager.allPhotosPreview);
        } else {
          Navigator.of(context)
              .pushNamed(RouteManager.singlePhotoPreview, arguments: file);
        }
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Hero(
                tag: heroImageTag1,
                child: Material(child: Image.file(file)),
              ),
              (!isFourthImage)
                  ? Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                        padding: EdgeInsets.all(2),
                        iconSize: 20,
                        onPressed: () {
                          context.read<PhotosNotifier>().removeImage(file);
                        },
                        icon: Icon(Icons.cancel),
                      ),
                    )
                  : Container(
                      color: Colors.black54,
                      child: Center(
                        child: Text(
                          "+ ${context.watch<PhotosNotifier>().workSheetImages.length - 4}",
                          style: genTxt.copyWith(
                            fontSize: 20,
                            color: colorBackground,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
