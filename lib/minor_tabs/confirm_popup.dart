import 'package:flutter/material.dart';
import 'package:ksb_app/constants/input_decor.dart';
import 'package:ksb_app/constants/palette.dart';
import 'package:ksb_app/notifiers/work_sheet_notifier.dart';
import 'package:ksb_app/utils/utils.dart';
import 'package:provider/provider.dart';

class ConfirmPopUp extends StatelessWidget {
  final List<String> popupStrings;
  const ConfirmPopUp({
    Key? key,
    required this.popupStrings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: 180,
          constraints: BoxConstraints(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                child: Text(
                  popupStrings[0],
                  softWrap: true,
                  style: genTxt.copyWith(
                    fontSize: 15,
                    color: colorPrimary,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("CANCEL"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        popupFunctions[popupStrings[1]]!(
                            context,
                            context
                                .read<WorkSheetNotifier>()
                                .currentWorkSheet!);
                      },
                      child: Text("OK"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
