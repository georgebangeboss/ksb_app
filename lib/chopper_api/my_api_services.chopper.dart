// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_api_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$MyApiService extends MyApiService {
  _$MyApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MyApiService;

  @override
  Future<Response<dynamic>> postNewWorkSheet({required BuiltWorkSheet body}) {
    final $url = '/';
    final $headers = {
      'content-type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postWorkSheet(
      {List<http.MultipartFile>? images,
      required List<int> clientSignatureImage,
      required List<int> engineerSignatureImage,
      required String report,
      required String recommendation,
      required String actionWorkRequired,
      required DateTime arrivalTime,
      required DateTime departureTime,
      required String vehicleReg,
      required int startMileage,
      required int endMileage,
      required String location,
      required DateTime date,
      required String department,
      required String jobNumber,
      required String clientSignature,
      required String engineerSignature,
      String? manager,
      String? clientRep,
      String? clientOrg,
      String? engineer,
      String? timeSpent,
      int? distanceCovered}) {
    final $url = '/create';
    final $headers = {
      'content-type': 'multipart/form-data',
    };

    final $parts = <PartValue>[
      PartValue<List<http.MultipartFile>?>('work_sheet_images', images),
      PartValue<String>('report', report),
      PartValue<String>('recommendation', recommendation),
      PartValue<String>('action_work_required', actionWorkRequired),
      PartValue<DateTime>('arrival_time', arrivalTime),
      PartValue<DateTime>('departure_time', departureTime),
      PartValue<String>('vehicle_reg', vehicleReg),
      PartValue<int>('start_mileage', startMileage),
      PartValue<int>('end_mileage', endMileage),
      PartValue<String>('location', location),
      PartValue<DateTime>('date', date),
      PartValue<String>('department', department),
      PartValue<String>('job_number', jobNumber),
      PartValue<String>('client_signature', clientSignature),
      PartValue<String>('engineer_signature', engineerSignature),
      PartValue<String?>('manager', manager),
      PartValue<String?>('client', clientRep),
      PartValue<String?>('client_org', clientOrg),
      PartValue<String?>('engineer', engineer),
      PartValue<String?>('time_spent', timeSpent),
      PartValue<int?>('distance_covered', distanceCovered),
      PartValueFile<List<int>>('client_sig_pic', clientSignatureImage),
      PartValueFile<List<int>>('engineer_sig_pic', engineerSignatureImage)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
