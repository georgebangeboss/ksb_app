import 'package:flutter/material.dart';

const radius = 3.0;

class SelectionBottomSheet extends StatelessWidget {
  final Function() addMultiple;
  final Function() addCamera;
  const SelectionBottomSheet({
    Key? key,
    required this.addCamera,
    required this.addMultiple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () async {
                await addCamera();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Gallery"),
              onTap: () async {
                await addMultiple();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
