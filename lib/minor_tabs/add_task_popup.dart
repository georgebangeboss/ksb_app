import 'package:flutter/material.dart';

class AddTaskPopup extends StatelessWidget {
  const AddTaskPopup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
        opacity: 0.5,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: 30.0, bottom: 135),
            width: 230,
            height: 130,
            constraints: BoxConstraints(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(3),
            child: Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Daily Work Sheet",
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Text("Submersive Pump Commission")),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Text("Submersive Pump Commission")),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
