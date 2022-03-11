import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ksb_app/constants/string_res.dart';
import 'package:ksb_app/notifiers/photos_notifier.dart';
import 'package:provider/provider.dart';

class AllPhotosPreview extends StatelessWidget {
  const AllPhotosPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Photos"),
      ),
      body: Consumer<PhotosNotifier>(builder: (context, photoNotifier, _) {
        var images = photoNotifier.workSheetImages;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            showTrackOnHover: true,
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 6, top: 2),
                      child: Image.file(images[index]),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                          onPressed: () {
                            context
                                .read<PhotosNotifier>()
                                .removeImage(images[index]);
                          },
                          icon: Icon(Icons.close)),
                    )
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

class SinglePhotoPreview extends StatelessWidget {
  final File file;
  const SinglePhotoPreview({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Preview"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<PhotosNotifier>().removeImage(file);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Hero(
          tag: heroImageTag1,
          child: Material(
            child: Image.file(file),
          ),
        ),
      )),
    );
  }
}
