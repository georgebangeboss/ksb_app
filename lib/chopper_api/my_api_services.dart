import 'package:chopper/chopper.dart';
import 'package:ksb_app/chopper_api/converter.dart';
import 'package:ksb_app/my_models/work_sheet.dart';

import 'package:http/http.dart' as http;

part 'my_api_services.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class MyApiService extends ChopperService {
  @Post(path: '/', headers: {'content-type': 'application/json'})
  Future<Response> postNewWorkSheet({@Body() required BuiltWorkSheet body});

  @Post(path: '/create', headers: {'content-type': 'multipart/form-data'})
  @multipart
  Future<Response> postWorkSheet({
    @Part("work_sheet_images") List<http.MultipartFile>? images,
    @PartFile("client_sig_pic") required List<int> clientSignatureImage,
    @PartFile("engineer_sig_pic") required List<int> engineerSignatureImage,

    //@Body() BuiltWorkSheet? workSheet,

    @Part("report") required String report,
    @Part("recommendation") required String recommendation,
    @Part("action_work_required") required String actionWorkRequired,
    @Part("arrival_time") required DateTime arrivalTime,
    @Part("departure_time") required DateTime departureTime,
    @Part("vehicle_reg") required String vehicleReg,
    @Part("start_mileage") required int startMileage,
    @Part("end_mileage") required int endMileage,
    @Part("location") required String location,
    @Part("date") required DateTime date,
    @Part("department") required String department,
    @Part("job_number") required String jobNumber,
    @Part("client_signature") required String clientSignature,
    @Part("engineer_signature") required String engineerSignature,
    @Part("manager") String? manager,
    @Part("client") String? clientRep,
    @Part("client_org") String? clientOrg,
    @Part("engineer") String? engineer,
    @Part("time_spent") String? timeSpent,
    @Part("distance_covered") int? distanceCovered,
  });

  static MyApiService create() {
    final client = ChopperClient(
      baseUrl: "https://ksballasoaps.herokuapp.com",
      services: [
        _$MyApiService(),
      ],
      converter: BuiltValueConverter(),
    );

    return _$MyApiService(client);
  }

  static ChopperClient recreateClient(String stringUrl) {
    return ChopperClient(
      baseUrl: stringUrl,
      services: [
        _$MyApiService(),
      ],
      converter: BuiltValueConverter(),
    );
  }
}
