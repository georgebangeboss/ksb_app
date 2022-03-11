import 'package:flutter/material.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/constants/palette.dart';
import 'package:ksb_app/my_models/job.dart';
import 'package:ksb_app/routes/routes.dart';

class TaskCard extends StatelessWidget {
  final BuiltJob builtJob;
  const TaskCard({Key? key, required this.builtJob}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: shadowColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 2),
        child: Column(
          children: [
            Container(
              color: colorSurface,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "JOB ",
                        style: genTxt.copyWith(
                          color: supremeSpanText,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: builtJob.jobID,
                            style: genTxt.copyWith(
                              color: ksbSpanText,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (builtJob.dateCompleted != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                builtJob.dateCompleted!,
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                              color: (builtJob.dateCompleted != null)
                                  ? colorDone
                                  : colorUndone,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                builtJob.jobStatus!,
                                style: (builtJob.dateCompleted == null)
                                    ? genTxt.copyWith(color: colorOnRed)
                                    : genTxt.copyWith(color: colorOnRed),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  builtJob.clientName!,
                  style: genTxt.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Color.fromARGB(255, 243, 82, 70),
                    ),
                    Text(builtJob.clientLocation!),
                  ],
                ),
                OutlinedButton.icon(
                  label: Text("Call"),
                  onPressed: () {
                    //TODO initiate call
                  },
                  icon: Icon(Icons.call),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: "Requested Job : ",
                    style: genTxt.copyWith(
                      color: supremeSpanText,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: builtJob.jobDescription!,
                        style: genTxt.copyWith(
                          color: ksbSpanText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 1, bottom: 1),
              child: SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Date Assigned",
                          style: genTxt.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Assigned By",
                          style: genTxt.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "June 7th,2022",
                          style: genTxt.copyWith(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Paul Musau",
                          style: genTxt.copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            (builtJob.dateCompleted == null)
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                RouteManager.workSheet,
                                arguments: builtJob);
                          },
                          child: Text("New Work Sheet"),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text("Report Done"),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 7,
                  ),
          ],
        ),
      ),
    );
  }
}
