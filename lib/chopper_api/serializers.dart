import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ksb_app/my_models/job.dart';
import 'package:ksb_app/my_models/work_sheet.dart';

part 'serializers.g.dart';

@SerializersFor([
  BuiltWorkSheet,
  BuiltJob,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
