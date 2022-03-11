import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ksb_app/constants/palette.dart';
import 'package:ksb_app/constants/string_res.dart';
import 'package:ksb_app/notifiers/photos_notifier.dart';
import 'package:ksb_app/notifiers/work_sheet_notifier.dart';
import 'package:ksb_app/routes/routes.dart';
import 'package:ksb_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
//import 'dart:ui' as ui;

import 'package:http_parser/http_parser.dart';

import 'package:signature/signature.dart';

const sigBoxSize = 150.0;

class SignaturePage extends StatefulWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _clientSignatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: colorSignatureStroke,
  );
  final SignatureController _engSignatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: colorSignatureStroke,
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _clientSigString = "";
  var _engSigString = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _clientSignatureController.dispose();
    _engSignatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signatures"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close)),
      ),
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorBoxOutline),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Signature(
                      controller: _engSignatureController,
                      width: double.infinity,
                      backgroundColor: colorSurface,
                      height: sigBoxSize,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        _engSignatureController.clear();
                      },
                      label: Text("Engineer Signature"),
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorBoxOutline),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Signature(
                      controller: _clientSignatureController,
                      width: double.infinity,
                      backgroundColor: colorSurface,
                      height: sigBoxSize,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        _clientSignatureController.clear();
                      },
                      label: Text("Client Signature"),
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: onSubmitPressed,
              child: Text("Final Submit"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSubmitPressed() async {
    if (_engSignatureController.isNotEmpty &&
        _clientSignatureController.isNotEmpty) {
      final Uint8List? engPng = await _engSignatureController.toPngBytes();
      final Uint8List? clientPng =
          await _clientSignatureController.toPngBytes();

      if (engPng != null && clientPng != null) {
        final time1 = DateTime.now().toIso8601String().replaceAll(".", ':');
        final engSigPic = 'sign_$time1.png';
        await ImageGallerySaver.saveImage(engPng, name: engSigPic);
        final time2 = DateTime.now().toIso8601String().replaceAll(".", ':');
        final clientSigPic = 'sign_$time2.png';
        await ImageGallerySaver.saveImage(clientPng, name: clientSigPic);

        _clientSigString = base64.encode(clientPng);
        _engSigString = base64.encode(engPng);

        List<int> clientSignatureBytes = <int>[];
        List<int> engineerSignatureBytes = <int>[];

        for (var val in clientPng.toList()) {
          clientSignatureBytes.add(val.toInt());
        }

        for (var val in engPng.toList()) {
          engineerSignatureBytes.add(val.toInt());
        }

        context.read<PhotosNotifier>().clientSigPic = clientSignatureBytes;
        context.read<PhotosNotifier>().engineerSigPic = engineerSignatureBytes;

        Provider.of<WorkSheetNotifier>(context, listen: false).addSignatures(
          clientSignature: _clientSigString,
          engSignature: _engSigString,
        );
        Navigator.of(context)
            .popAndPushNamed(RouteManager.confirmPopup, arguments: <String>[
          finalSubmissionString,
          pushToDBFunction,
        ]);
      } else {
        createSnackBar(
            context: _scaffoldKey.currentState!.context,
            text: "There's a null");
      }
    } else {
      createSnackBar(
          context: _scaffoldKey.currentState!.context,
          text: "Both Signatures are required first");
    }
  }
}

// Future<String?> getImageString(BuildContext context) async {
//   ui.PictureRecorder recorder = ui.PictureRecorder();
//   Canvas canvas = Canvas(recorder);
//   var dpr = ui.window.devicePixelRatio;
//   canvas.scale(dpr, dpr);
//   SignaturePainter painter = SignaturePainter(_points);
//   var size = context.size;
//   painter.paint(canvas, size!);
//   ui.Image image = await recorder
//       .endRecording()
//       .toImage((size.width * dpr).ceil(), (size.height * dpr).ceil());

//   final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//   final time = DateTime.now().toIso8601String().replaceAll(".", ':');
//   final name = 'sign_$time.png';

//   await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List(), name: name);

//   //Uint8List? pngUint8List = byteData?.buffer.asUint8List();

//   Uint8List? pngUint8List = Uint8List.view(byteData.buffer);

//   String byteString = base64.encode(pngUint8List);

//   return byteString;
// }

// class SignaturePainter extends CustomPainter {
//   final List<Offset?> offsets;
//   SignaturePainter(this.offsets);
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.save();
//     Rect rect = Offset.zero & size;
//     canvas.clipRect(rect);
//     final paint = Paint()
//       ..color = colorSignatureStroke
//       ..strokeWidth = 3;

//     for (var i = 0; i < offsets.length; i++) {
//       if (shouldDrawLine(i)) {
//         canvas.drawLine(offsets[i]!, offsets[i + 1]!, paint);
//       } else if (shouldDrawPoint(i)) {
//         canvas.drawPoints(ui.PointMode.points, [offsets[i]!], paint);
//       }
//     }
//     canvas.restore();
//   }

//   bool shouldDrawPoint(int i) =>
//       offsets[i] != null && offsets.length > i + 1 && offsets[i + 1] == null;

//   bool shouldDrawLine(int i) =>
//       offsets[i] != null && offsets.length > i + 1 && offsets[i + 1] != null;

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
