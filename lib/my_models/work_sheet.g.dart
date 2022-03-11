// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_sheet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltWorkSheet> _$builtWorkSheetSerializer =
    new _$BuiltWorkSheetSerializer();

class _$BuiltWorkSheetSerializer
    implements StructuredSerializer<BuiltWorkSheet> {
  @override
  final Iterable<Type> types = const [BuiltWorkSheet, _$BuiltWorkSheet];
  @override
  final String wireName = 'BuiltWorkSheet';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltWorkSheet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'report',
      serializers.serialize(object.report,
          specifiedType: const FullType(String)),
      'actionWork',
      serializers.serialize(object.actionWork,
          specifiedType: const FullType(String)),
      'clientOrg',
      serializers.serialize(object.clientOrg,
          specifiedType: const FullType(String)),
      'engineerName',
      serializers.serialize(object.engineerName,
          specifiedType: const FullType(String)),
      'recommendations',
      serializers.serialize(object.recommendations,
          specifiedType: const FullType(String)),
      'engContact',
      serializers.serialize(object.engContact,
          specifiedType: const FullType(String)),
      'dept',
      serializers.serialize(object.dept, specifiedType: const FullType(String)),
      'siteLocation',
      serializers.serialize(object.siteLocation,
          specifiedType: const FullType(String)),
      'numberPlate',
      serializers.serialize(object.numberPlate,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
      'arrivalTime',
      serializers.serialize(object.arrivalTime,
          specifiedType: const FullType(DateTime)),
      'departureTime',
      serializers.serialize(object.departureTime,
          specifiedType: const FullType(DateTime)),
      'timeSpent',
      serializers.serialize(object.timeSpent,
          specifiedType: const FullType(String)),
      'startMileage',
      serializers.serialize(object.startMileage,
          specifiedType: const FullType(int)),
      'stopMileage',
      serializers.serialize(object.stopMileage,
          specifiedType: const FullType(int)),
      'distanceCovered',
      serializers.serialize(object.distanceCovered,
          specifiedType: const FullType(int)),
      'clientRep',
      serializers.serialize(object.clientRep,
          specifiedType: const FullType(String)),
      'clientRepContact',
      serializers.serialize(object.clientRepContact,
          specifiedType: const FullType(String)),
      'managerName',
      serializers.serialize(object.managerName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.jobNumber;
    if (value != null) {
      result
        ..add('jobNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.formSerialNumber;
    if (value != null) {
      result
        ..add('formSerialNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientSignatureString;
    if (value != null) {
      result
        ..add('clientSignatureString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.engSignatureString;
    if (value != null) {
      result
        ..add('engSignatureString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuiltWorkSheet deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltWorkSheetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'report':
          result.report = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'actionWork':
          result.actionWork = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clientOrg':
          result.clientOrg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'engineerName':
          result.engineerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'recommendations':
          result.recommendations = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'engContact':
          result.engContact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dept':
          result.dept = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'siteLocation':
          result.siteLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'jobNumber':
          result.jobNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'formSerialNumber':
          result.formSerialNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numberPlate':
          result.numberPlate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'arrivalTime':
          result.arrivalTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'departureTime':
          result.departureTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'timeSpent':
          result.timeSpent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startMileage':
          result.startMileage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'stopMileage':
          result.stopMileage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'distanceCovered':
          result.distanceCovered = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'clientRep':
          result.clientRep = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clientRepContact':
          result.clientRepContact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'managerName':
          result.managerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clientSignatureString':
          result.clientSignatureString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'engSignatureString':
          result.engSignatureString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltWorkSheet extends BuiltWorkSheet {
  @override
  final String report;
  @override
  final String actionWork;
  @override
  final String clientOrg;
  @override
  final String engineerName;
  @override
  final String recommendations;
  @override
  final String engContact;
  @override
  final String dept;
  @override
  final String siteLocation;
  @override
  final String? jobNumber;
  @override
  final String? formSerialNumber;
  @override
  final String numberPlate;
  @override
  final DateTime date;
  @override
  final DateTime arrivalTime;
  @override
  final DateTime departureTime;
  @override
  final String timeSpent;
  @override
  final int startMileage;
  @override
  final int stopMileage;
  @override
  final int distanceCovered;
  @override
  final String clientRep;
  @override
  final String clientRepContact;
  @override
  final String managerName;
  @override
  final String? clientSignatureString;
  @override
  final String? engSignatureString;

  factory _$BuiltWorkSheet([void Function(BuiltWorkSheetBuilder)? updates]) =>
      (new BuiltWorkSheetBuilder()..update(updates)).build();

  _$BuiltWorkSheet._(
      {required this.report,
      required this.actionWork,
      required this.clientOrg,
      required this.engineerName,
      required this.recommendations,
      required this.engContact,
      required this.dept,
      required this.siteLocation,
      this.jobNumber,
      this.formSerialNumber,
      required this.numberPlate,
      required this.date,
      required this.arrivalTime,
      required this.departureTime,
      required this.timeSpent,
      required this.startMileage,
      required this.stopMileage,
      required this.distanceCovered,
      required this.clientRep,
      required this.clientRepContact,
      required this.managerName,
      this.clientSignatureString,
      this.engSignatureString})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(report, 'BuiltWorkSheet', 'report');
    BuiltValueNullFieldError.checkNotNull(
        actionWork, 'BuiltWorkSheet', 'actionWork');
    BuiltValueNullFieldError.checkNotNull(
        clientOrg, 'BuiltWorkSheet', 'clientOrg');
    BuiltValueNullFieldError.checkNotNull(
        engineerName, 'BuiltWorkSheet', 'engineerName');
    BuiltValueNullFieldError.checkNotNull(
        recommendations, 'BuiltWorkSheet', 'recommendations');
    BuiltValueNullFieldError.checkNotNull(
        engContact, 'BuiltWorkSheet', 'engContact');
    BuiltValueNullFieldError.checkNotNull(dept, 'BuiltWorkSheet', 'dept');
    BuiltValueNullFieldError.checkNotNull(
        siteLocation, 'BuiltWorkSheet', 'siteLocation');
    BuiltValueNullFieldError.checkNotNull(
        numberPlate, 'BuiltWorkSheet', 'numberPlate');
    BuiltValueNullFieldError.checkNotNull(date, 'BuiltWorkSheet', 'date');
    BuiltValueNullFieldError.checkNotNull(
        arrivalTime, 'BuiltWorkSheet', 'arrivalTime');
    BuiltValueNullFieldError.checkNotNull(
        departureTime, 'BuiltWorkSheet', 'departureTime');
    BuiltValueNullFieldError.checkNotNull(
        timeSpent, 'BuiltWorkSheet', 'timeSpent');
    BuiltValueNullFieldError.checkNotNull(
        startMileage, 'BuiltWorkSheet', 'startMileage');
    BuiltValueNullFieldError.checkNotNull(
        stopMileage, 'BuiltWorkSheet', 'stopMileage');
    BuiltValueNullFieldError.checkNotNull(
        distanceCovered, 'BuiltWorkSheet', 'distanceCovered');
    BuiltValueNullFieldError.checkNotNull(
        clientRep, 'BuiltWorkSheet', 'clientRep');
    BuiltValueNullFieldError.checkNotNull(
        clientRepContact, 'BuiltWorkSheet', 'clientRepContact');
    BuiltValueNullFieldError.checkNotNull(
        managerName, 'BuiltWorkSheet', 'managerName');
  }

  @override
  BuiltWorkSheet rebuild(void Function(BuiltWorkSheetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltWorkSheetBuilder toBuilder() =>
      new BuiltWorkSheetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltWorkSheet &&
        report == other.report &&
        actionWork == other.actionWork &&
        clientOrg == other.clientOrg &&
        engineerName == other.engineerName &&
        recommendations == other.recommendations &&
        engContact == other.engContact &&
        dept == other.dept &&
        siteLocation == other.siteLocation &&
        jobNumber == other.jobNumber &&
        formSerialNumber == other.formSerialNumber &&
        numberPlate == other.numberPlate &&
        date == other.date &&
        arrivalTime == other.arrivalTime &&
        departureTime == other.departureTime &&
        timeSpent == other.timeSpent &&
        startMileage == other.startMileage &&
        stopMileage == other.stopMileage &&
        distanceCovered == other.distanceCovered &&
        clientRep == other.clientRep &&
        clientRepContact == other.clientRepContact &&
        managerName == other.managerName &&
        clientSignatureString == other.clientSignatureString &&
        engSignatureString == other.engSignatureString;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc(0, report.hashCode), actionWork.hashCode), clientOrg.hashCode), engineerName.hashCode),
                                                                                recommendations.hashCode),
                                                                            engContact.hashCode),
                                                                        dept.hashCode),
                                                                    siteLocation.hashCode),
                                                                jobNumber.hashCode),
                                                            formSerialNumber.hashCode),
                                                        numberPlate.hashCode),
                                                    date.hashCode),
                                                arrivalTime.hashCode),
                                            departureTime.hashCode),
                                        timeSpent.hashCode),
                                    startMileage.hashCode),
                                stopMileage.hashCode),
                            distanceCovered.hashCode),
                        clientRep.hashCode),
                    clientRepContact.hashCode),
                managerName.hashCode),
            clientSignatureString.hashCode),
        engSignatureString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltWorkSheet')
          ..add('report', report)
          ..add('actionWork', actionWork)
          ..add('clientOrg', clientOrg)
          ..add('engineerName', engineerName)
          ..add('recommendations', recommendations)
          ..add('engContact', engContact)
          ..add('dept', dept)
          ..add('siteLocation', siteLocation)
          ..add('jobNumber', jobNumber)
          ..add('formSerialNumber', formSerialNumber)
          ..add('numberPlate', numberPlate)
          ..add('date', date)
          ..add('arrivalTime', arrivalTime)
          ..add('departureTime', departureTime)
          ..add('timeSpent', timeSpent)
          ..add('startMileage', startMileage)
          ..add('stopMileage', stopMileage)
          ..add('distanceCovered', distanceCovered)
          ..add('clientRep', clientRep)
          ..add('clientRepContact', clientRepContact)
          ..add('managerName', managerName)
          ..add('clientSignatureString', clientSignatureString)
          ..add('engSignatureString', engSignatureString))
        .toString();
  }
}

class BuiltWorkSheetBuilder
    implements Builder<BuiltWorkSheet, BuiltWorkSheetBuilder> {
  _$BuiltWorkSheet? _$v;

  String? _report;
  String? get report => _$this._report;
  set report(String? report) => _$this._report = report;

  String? _actionWork;
  String? get actionWork => _$this._actionWork;
  set actionWork(String? actionWork) => _$this._actionWork = actionWork;

  String? _clientOrg;
  String? get clientOrg => _$this._clientOrg;
  set clientOrg(String? clientOrg) => _$this._clientOrg = clientOrg;

  String? _engineerName;
  String? get engineerName => _$this._engineerName;
  set engineerName(String? engineerName) => _$this._engineerName = engineerName;

  String? _recommendations;
  String? get recommendations => _$this._recommendations;
  set recommendations(String? recommendations) =>
      _$this._recommendations = recommendations;

  String? _engContact;
  String? get engContact => _$this._engContact;
  set engContact(String? engContact) => _$this._engContact = engContact;

  String? _dept;
  String? get dept => _$this._dept;
  set dept(String? dept) => _$this._dept = dept;

  String? _siteLocation;
  String? get siteLocation => _$this._siteLocation;
  set siteLocation(String? siteLocation) => _$this._siteLocation = siteLocation;

  String? _jobNumber;
  String? get jobNumber => _$this._jobNumber;
  set jobNumber(String? jobNumber) => _$this._jobNumber = jobNumber;

  String? _formSerialNumber;
  String? get formSerialNumber => _$this._formSerialNumber;
  set formSerialNumber(String? formSerialNumber) =>
      _$this._formSerialNumber = formSerialNumber;

  String? _numberPlate;
  String? get numberPlate => _$this._numberPlate;
  set numberPlate(String? numberPlate) => _$this._numberPlate = numberPlate;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DateTime? _arrivalTime;
  DateTime? get arrivalTime => _$this._arrivalTime;
  set arrivalTime(DateTime? arrivalTime) => _$this._arrivalTime = arrivalTime;

  DateTime? _departureTime;
  DateTime? get departureTime => _$this._departureTime;
  set departureTime(DateTime? departureTime) =>
      _$this._departureTime = departureTime;

  String? _timeSpent;
  String? get timeSpent => _$this._timeSpent;
  set timeSpent(String? timeSpent) => _$this._timeSpent = timeSpent;

  int? _startMileage;
  int? get startMileage => _$this._startMileage;
  set startMileage(int? startMileage) => _$this._startMileage = startMileage;

  int? _stopMileage;
  int? get stopMileage => _$this._stopMileage;
  set stopMileage(int? stopMileage) => _$this._stopMileage = stopMileage;

  int? _distanceCovered;
  int? get distanceCovered => _$this._distanceCovered;
  set distanceCovered(int? distanceCovered) =>
      _$this._distanceCovered = distanceCovered;

  String? _clientRep;
  String? get clientRep => _$this._clientRep;
  set clientRep(String? clientRep) => _$this._clientRep = clientRep;

  String? _clientRepContact;
  String? get clientRepContact => _$this._clientRepContact;
  set clientRepContact(String? clientRepContact) =>
      _$this._clientRepContact = clientRepContact;

  String? _managerName;
  String? get managerName => _$this._managerName;
  set managerName(String? managerName) => _$this._managerName = managerName;

  String? _clientSignatureString;
  String? get clientSignatureString => _$this._clientSignatureString;
  set clientSignatureString(String? clientSignatureString) =>
      _$this._clientSignatureString = clientSignatureString;

  String? _engSignatureString;
  String? get engSignatureString => _$this._engSignatureString;
  set engSignatureString(String? engSignatureString) =>
      _$this._engSignatureString = engSignatureString;

  BuiltWorkSheetBuilder();

  BuiltWorkSheetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _report = $v.report;
      _actionWork = $v.actionWork;
      _clientOrg = $v.clientOrg;
      _engineerName = $v.engineerName;
      _recommendations = $v.recommendations;
      _engContact = $v.engContact;
      _dept = $v.dept;
      _siteLocation = $v.siteLocation;
      _jobNumber = $v.jobNumber;
      _formSerialNumber = $v.formSerialNumber;
      _numberPlate = $v.numberPlate;
      _date = $v.date;
      _arrivalTime = $v.arrivalTime;
      _departureTime = $v.departureTime;
      _timeSpent = $v.timeSpent;
      _startMileage = $v.startMileage;
      _stopMileage = $v.stopMileage;
      _distanceCovered = $v.distanceCovered;
      _clientRep = $v.clientRep;
      _clientRepContact = $v.clientRepContact;
      _managerName = $v.managerName;
      _clientSignatureString = $v.clientSignatureString;
      _engSignatureString = $v.engSignatureString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltWorkSheet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuiltWorkSheet;
  }

  @override
  void update(void Function(BuiltWorkSheetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltWorkSheet build() {
    final _$result = _$v ??
        new _$BuiltWorkSheet._(
            report: BuiltValueNullFieldError.checkNotNull(
                report, 'BuiltWorkSheet', 'report'),
            actionWork: BuiltValueNullFieldError.checkNotNull(
                actionWork, 'BuiltWorkSheet', 'actionWork'),
            clientOrg: BuiltValueNullFieldError.checkNotNull(
                clientOrg, 'BuiltWorkSheet', 'clientOrg'),
            engineerName: BuiltValueNullFieldError.checkNotNull(
                engineerName, 'BuiltWorkSheet', 'engineerName'),
            recommendations: BuiltValueNullFieldError.checkNotNull(
                recommendations, 'BuiltWorkSheet', 'recommendations'),
            engContact: BuiltValueNullFieldError.checkNotNull(
                engContact, 'BuiltWorkSheet', 'engContact'),
            dept: BuiltValueNullFieldError.checkNotNull(
                dept, 'BuiltWorkSheet', 'dept'),
            siteLocation: BuiltValueNullFieldError.checkNotNull(
                siteLocation, 'BuiltWorkSheet', 'siteLocation'),
            jobNumber: jobNumber,
            formSerialNumber: formSerialNumber,
            numberPlate: BuiltValueNullFieldError.checkNotNull(numberPlate, 'BuiltWorkSheet', 'numberPlate'),
            date: BuiltValueNullFieldError.checkNotNull(date, 'BuiltWorkSheet', 'date'),
            arrivalTime: BuiltValueNullFieldError.checkNotNull(arrivalTime, 'BuiltWorkSheet', 'arrivalTime'),
            departureTime: BuiltValueNullFieldError.checkNotNull(departureTime, 'BuiltWorkSheet', 'departureTime'),
            timeSpent: BuiltValueNullFieldError.checkNotNull(timeSpent, 'BuiltWorkSheet', 'timeSpent'),
            startMileage: BuiltValueNullFieldError.checkNotNull(startMileage, 'BuiltWorkSheet', 'startMileage'),
            stopMileage: BuiltValueNullFieldError.checkNotNull(stopMileage, 'BuiltWorkSheet', 'stopMileage'),
            distanceCovered: BuiltValueNullFieldError.checkNotNull(distanceCovered, 'BuiltWorkSheet', 'distanceCovered'),
            clientRep: BuiltValueNullFieldError.checkNotNull(clientRep, 'BuiltWorkSheet', 'clientRep'),
            clientRepContact: BuiltValueNullFieldError.checkNotNull(clientRepContact, 'BuiltWorkSheet', 'clientRepContact'),
            managerName: BuiltValueNullFieldError.checkNotNull(managerName, 'BuiltWorkSheet', 'managerName'),
            clientSignatureString: clientSignatureString,
            engSignatureString: engSignatureString);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
