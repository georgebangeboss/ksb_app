import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/constants/dummy_data.dart';
import 'package:ksb_app/constants/string_res.dart';
import 'package:ksb_app/minor_tabs/grid_photo_tile.dart';
import 'package:ksb_app/minor_tabs/selection_modal_sheet.dart';
import 'package:ksb_app/my_models/job.dart';
import 'package:ksb_app/my_models/work_sheet.dart';
import 'package:ksb_app/notifiers/photos_notifier.dart';
import 'package:ksb_app/notifiers/work_sheet_notifier.dart';
import 'package:ksb_app/routes/routes.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class WorkSheetPage extends StatefulWidget {
  final BuiltJob builtJob;
  const WorkSheetPage({Key? key, required this.builtJob}) : super(key: key);

  @override
  State<WorkSheetPage> createState() => _WorkSheetPageState();
}

class _WorkSheetPageState extends State<WorkSheetPage> {
  late TextEditingController reportController;
  late TextEditingController startMileageController;
  late TextEditingController stopMileageController;
  late TextEditingController recommendationsController;
  late TextEditingController actionRequiredController;
  late TimeOfDay? startTimeOfDay, stopTimeOfDay;
  late DateTime? startDateTime, stopDateTime;
  TextEditingController startTimeController = TextEditingController(text: "--");
  TextEditingController stopTimeController = TextEditingController(text: "--");

  var report = "";
  var recommendationz = "";
  var actionWorkz = "";
  var _startMileage = 0;
  var _stopMileage = 0;
  var hoursSpent = 0;
  var minsSpent = 0;
  var _timeSpent = "";

  int distance = 0;

  bool isStartMileageChanged = false;
  bool isStopMileageChanged = false;

  bool isStartTimeChanged = false;
  bool isStopTimeChanged = false;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldStateKey = GlobalKey<State>();
  final _points = <Offset?>[];
  final _sigKey = GlobalKey();
  @override
  void dispose() {
    startMileageController.dispose();
    stopMileageController.dispose();
    startTimeController.dispose();
    stopTimeController.dispose();
    recommendationsController.dispose();
    actionRequiredController.dispose();
    reportController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    DateTime now = DateTime.now();
    stopDateTime = now;
    startDateTime = now;

    TimeOfDay timeNow = TimeOfDay.now();
    stopTimeOfDay = timeNow;
    startTimeOfDay = timeNow;
    reportController = TextEditingController();
    recommendationsController = TextEditingController();
    actionRequiredController = TextEditingController();
    startMileageController = TextEditingController();
    stopMileageController = TextEditingController();
    stopTimeController.addListener(_timeListener);
    startTimeController.addListener(_timeListener);
    _requestPermission();
    super.initState();
  }

  Future pickImageCamera() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      File file = File(image.path);
      Provider.of<PhotosNotifier>(context, listen: false).addImage(file);
      await ImageGallerySaver.saveFile(file.path);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future pickImages() async {
    try {
      var images = await ImagePicker().pickMultiImage();
      if (images == null) {
        return;
      }
      for (XFile image in images) {
        Provider.of<PhotosNotifier>(context, listen: false)
            .addImage(File(image.path));
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void _timeListener() {
    if (isStartTimeChanged || isStopTimeChanged) {
      setState(() {});
    }
    if (isStartTimeChanged && isStopTimeChanged) {
      setState(() {
        Duration duration = stopDateTime!.difference(startDateTime!);
        int timeInMinutes = duration.inMinutes;

        if (timeInMinutes.isNegative) {
          hoursSpent = (timeInMinutes / 60).ceil();
          minsSpent = (timeInMinutes % 60 == 0) ? 0 : (60 - timeInMinutes % 60);
          if (hoursSpent == 0) {
            minsSpent = -minsSpent;
          }
        } else {
          hoursSpent = (timeInMinutes / 60).floor();
          minsSpent = timeInMinutes % 60;
        }
        getTimeDiffString(hoursSpent, minsSpent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      appBar: AppBar(
        title: Text("Work Sheet ${widget.builtJob.jobID}"),
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  child: Column(
                    children: [
                      Material(
                        child: TextFormField(
                          controller: startTimeController,
                          showCursor: false,
                          readOnly: true,
                          onTap: () async {
                            await showTimePicker(
                              helpText: "Arrival Time",
                              errorInvalidText: "Invalid Time",
                              initialEntryMode: TimePickerEntryMode.input,
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: false),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialTime: startTimeOfDay!,
                            ).then((time) {
                              if (time != null) {
                                isStartTimeChanged = true;
                                startTimeOfDay = time;

                                startDateTime = getNewDateTime(
                                    startDateTime!, startTimeOfDay!);

                                startTimeController.text =
                                    DefaultMaterialLocalizations()
                                        .formatTimeOfDay(time);
                              }
                            });
                          },
                          decoration: inputDecor.copyWith(
                            label: Text("Arrival Time"),
                            suffixIcon: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 1),
                                  child: Text(
                                    startDateTime!.day.toString(),
                                    style: genTxt.copyWith(fontSize: 9),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await showDatePicker(
                                      context: context,
                                      initialDate: startDateTime!,
                                      firstDate: DateTime(2018),
                                      lastDate: DateTime(2070),
                                    ).then((date) {
                                      if (date != null) {
                                        isStartTimeChanged = true;
                                        startDateTime = date;
                                        startDateTime = getNewDateTime(
                                            startDateTime!, startTimeOfDay!);
                                        startTimeController.text =
                                            DefaultMaterialLocalizations()
                                                .formatTimeOfDay(
                                                    startTimeOfDay!);
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.calendar_today,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          validator: (inputText) {
                            if (inputText == null || inputText == "--") {
                              return mandatoryWarning;
                            }
                            if (startDateTime!.isAfter(stopDateTime!)) {
                              return invalidDates;
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Material(
                        child: TextFormField(
                          showCursor: false,
                          controller: stopTimeController,
                          readOnly: true,
                          onTap: () async {
                            await showTimePicker(
                              helpText: "Departure Time",
                              initialEntryMode: TimePickerEntryMode.input,
                              errorInvalidText: "Invalid Time",
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: false),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialTime: stopTimeOfDay!,
                            ).then((time) {
                              if (time != null) {
                                isStopTimeChanged = true;
                                stopTimeOfDay = time;
                                stopDateTime = getNewDateTime(
                                    stopDateTime!, stopTimeOfDay!);
                                stopTimeController.text =
                                    DefaultMaterialLocalizations()
                                        .formatTimeOfDay(time);
                              }
                            });
                          },
                          decoration: inputDecor.copyWith(
                              label: Text("Departure Time"),
                              suffixIcon: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 4, left: 1),
                                    child: Text(
                                      stopDateTime!.day.toString(),
                                      style: genTxt.copyWith(fontSize: 9),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        await showDatePicker(
                                          context: context,
                                          initialDate: stopDateTime!,
                                          firstDate: DateTime(2018),
                                          lastDate: DateTime(2070),
                                        ).then((date) {
                                          if (date != null) {
                                            isStopTimeChanged = true;
                                            stopDateTime = date;
                                            stopDateTime = getNewDateTime(
                                                stopDateTime!, stopTimeOfDay!);
                                            stopTimeController.text =
                                                DefaultMaterialLocalizations()
                                                    .formatTimeOfDay(
                                                        stopTimeOfDay!);
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.calendar_today)),
                                ],
                              )),
                          validator: (inputText) {
                            if (inputText == null || inputText == "--") {
                              return mandatoryWarning;
                            }
                            if (startDateTime!.isAfter(stopDateTime!)) {
                              return invalidDates;
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Hours Spent",
                            style: genTxt.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (startTimeController.text == "--" ||
                                    stopTimeController.text == "--")
                                ? ""
                                : _timeSpent,
                            style: genTxt.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: startMileageController,
                        keyboardType: TextInputType.number,
                        decoration: inputDecor.copyWith(
                            labelText: 'Start Mileage', suffix: Text("km")),
                        onSaved: (mileage) {
                          _startMileage = int.parse(mileage!);
                        },
                        onChanged: (mileage) {
                          _startMileage =
                              int.parse(startMileageController.text);
                          isStartMileageChanged = true;
                          if (isStopMileageChanged) {
                            setState(() {
                              distance = _stopMileage - _startMileage;
                            });
                          }
                        },
                        validator: (mileAge) {
                          if (distance < 0) {
                            return invalidMileage;
                          }
                          if (mileAge != null) {
                            if (mileAge.isNotEmpty) {
                              return null;
                            }
                          }
                          return "Mandatory";
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: stopMileageController,
                        keyboardType: TextInputType.number,
                        decoration: inputDecor.copyWith(
                            labelText: 'Stop Mileage', suffix: Text("km")),
                        onSaved: (mileage) {
                          _stopMileage = int.parse(mileage!);
                        },
                        onChanged: (mileage) {
                          _stopMileage = int.parse(stopMileageController.text);
                          isStopMileageChanged = true;
                          if (isStartMileageChanged) {
                            setState(() {
                              distance = _stopMileage - _startMileage;
                            });
                          }
                        },
                        validator: (mileAge) {
                          if (distance < 0) {
                            return invalidMileage;
                          }
                          if (mileAge != null) {
                            if (mileAge.isNotEmpty) {
                              return null;
                            }
                          }

                          return "Mandatory";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Distance Covered",
                            style: genTxt.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (startMileageController.text.trim().isEmpty ||
                                    stopMileageController.text.trim().isEmpty)
                                ? ""
                                : "$distance km",
                            style: genTxt.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: reportController,
                        keyboardType: TextInputType.multiline,
                        maxLength: 400,
                        maxLines: 8,
                        minLines: 5,
                        decoration: inputDecor.copyWith(
                          labelText: 'Report',
                          hintText: 'Write Report',
                        ),
                        onSaved: (rePort) {
                          report = rePort!;
                        },
                        validator: (report) {
                          if (report != null) {
                            if (report.isNotEmpty) {
                              return null;
                            }
                          }
                          return "Please Fill Report";
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLength: 400,
                        controller: recommendationsController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        minLines: 5,
                        decoration: inputDecor.copyWith(
                          labelText: 'Recommendations',
                          hintText: 'Write recommendations',
                        ),
                        onSaved: (recommendations) {
                          recommendationz = recommendations!;
                        },
                        validator: (recommendations) {
                          if (recommendations != null) {
                            if (recommendations.isNotEmpty) {
                              return null;
                            }
                          }
                          return "Please Fill Recommendations";
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: actionRequiredController,
                        maxLength: 400,
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        minLines: 5,
                        decoration: inputDecor.copyWith(
                          labelText: 'Action Work Required',
                          hintText: 'Fill Action Work Required',
                        ),
                        onSaved: (val) {
                          actionWorkz = val!;
                        },
                        validator: (val) {
                          if (val != null) {
                            if (val.isNotEmpty) {
                              return null;
                            }
                          }
                          return "Please Fill Action Work Required";
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  key: _formKey,
                ),
                Consumer<PhotosNotifier>(
                    builder: (context, photosNotifier, child) {
                  return Column(
                    children: [
                      if (photosNotifier.workSheetImages.isNotEmpty)
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          itemBuilder: (_, index) {
                            var images = photosNotifier.workSheetImages;
                            if (index == 3 && images.length > 4) {
                              return GridPhotoTile(
                                  file: images[index], isFourthImage: true);
                            } else {
                              return GridPhotoTile(file: images[index]);
                            }
                          },
                          itemCount: getItemCount(context, photosNotifier),
                        ),
                      OutlinedButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) => SelectionBottomSheet (
                                    addCamera: pickImageCamera,
                                    addMultiple: pickImages));
                          },
                          icon: Icon(Icons.add),
                          label: Text(
                              "Photos (${photosNotifier.workSheetImages.length})"))
                    ],
                  );
                }),
                Builder(builder: (context) {
                  return TextButton(
                    onPressed: () async {
                      FormState? formState = _formKey.currentState;
                      if (formState?.validate() ?? false) {
                        formState?.save();
                        final workSheet = BuiltWorkSheet(
                          (b) => b
                            ..actionWork = actionWorkz
                            ..report = report
                            ..recommendations = recommendationz
                            ..clientOrg = widget.builtJob.clientName
                            ..engineerName = widget.builtJob.engineerName
                            ..engContact = widget.builtJob.engineerContact
                            ..dept = widget.builtJob.engineerDept
                            ..siteLocation = widget.builtJob.clientLocation
                            ..date = startDateTime
                            ..arrivalTime = startDateTime
                            ..departureTime = stopDateTime
                            ..startMileage = _startMileage
                            ..stopMileage = _stopMileage
                            ..clientRep = widget.builtJob.clientRep
                            ..clientRepContact = widget.builtJob.clientContact
                            ..managerName = widget.builtJob.managerName
                            ..jobNumber = widget.builtJob.jobID
                            ..timeSpent = _timeSpent
                            ..distanceCovered = distance
                            ..numberPlate = numberPlate,
                        );
                        context
                            .read<WorkSheetNotifier>()
                            .updateWorkSheet(workSheet);
                        Navigator.of(context).pushNamed(
                            RouteManager.confirmPopup,
                            arguments: <String>[
                              proceedPopUpString,
                              proceedToSignaturesFunction,
                            ]);
                      }
                    },
                    child: Text("SUBMIT"),
                  );
                }),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
  }

  DateTime getNewDateTime(DateTime dateTime, TimeOfDay timeOfDay) {
    DateTime newDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    return newDateTime;
  }

  void getTimeDiffString(int hoursSpent, int minsSpent) {
    StringBuffer sb = StringBuffer();
    if (hoursSpent != 0) {
      sb.write(hoursSpent);
      sb.write(' hr');
      if (hoursSpent != 1 && hoursSpent != -1) {
        sb.write('s');
      }
      sb.write(" ");
    }
    if (minsSpent != 0) {
      sb.write(minsSpent);
      sb.write(' min');
      if (minsSpent != 1 && minsSpent != -1) {
        sb.write('s');
      }
    }

    if (sb.isEmpty) {
      sb.write("0 hrs");
    }
    _timeSpent = sb.toString();
  }

  int getItemCount(BuildContext context, PhotosNotifier photosNotifier) {
    int totalImages = photosNotifier.workSheetImages.length;
    if (totalImages < 4) {
      return totalImages;
    }
    return 4;
  }
}
