import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'work_sheet.g.dart';

abstract class BuiltWorkSheet
    implements Built<BuiltWorkSheet, BuiltWorkSheetBuilder> {
  // job number and form serial number
  String get report;
  String get actionWork;
  String get clientOrg;
  String get engineerName;
  String get recommendations;
  String get engContact;
  String get dept;
  String get siteLocation;
  String? get jobNumber;
  String? get formSerialNumber;
  String get numberPlate;
  DateTime get date;
  DateTime get arrivalTime;
  DateTime get departureTime;
  String get timeSpent;
  int get startMileage;
  int get stopMileage;
  int get distanceCovered;
  String get clientRep;
  String get clientRepContact;
  String get managerName;
  String? get clientSignatureString;
  String? get engSignatureString;

  BuiltWorkSheet._();

  factory BuiltWorkSheet([Function(BuiltWorkSheetBuilder b) updates]) =
      _$BuiltWorkSheet;

  static Serializer<BuiltWorkSheet> get serializer =>
      _$builtWorkSheetSerializer;
}
