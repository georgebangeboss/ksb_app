import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'job.g.dart';

abstract class BuiltJob implements Built<BuiltJob, BuiltJobBuilder> {
  String? get jobID;
  String? get dateAssigned;
  String? get dateCompleted;
  String? get jobStatus;
  String? get clientName;
  String? get clientContact;
  String? get managerName;
  String? get clientLocation;
  String? get engineerDept;
  String? get clientRep;
  String? get jobDescription;
  String? get engineerName;
  String? get engineerContact;

  BuiltJob._();

  factory BuiltJob([Function(BuiltJobBuilder b) updates]) = _$BuiltJob;

  static Serializer<BuiltJob> get serializer => _$builtJobSerializer;
}
