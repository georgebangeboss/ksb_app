// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltJob> _$builtJobSerializer = new _$BuiltJobSerializer();

class _$BuiltJobSerializer implements StructuredSerializer<BuiltJob> {
  @override
  final Iterable<Type> types = const [BuiltJob, _$BuiltJob];
  @override
  final String wireName = 'BuiltJob';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltJob object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.jobID;
    if (value != null) {
      result
        ..add('jobID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateAssigned;
    if (value != null) {
      result
        ..add('dateAssigned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateCompleted;
    if (value != null) {
      result
        ..add('dateCompleted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobStatus;
    if (value != null) {
      result
        ..add('jobStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientName;
    if (value != null) {
      result
        ..add('clientName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientContact;
    if (value != null) {
      result
        ..add('clientContact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.managerName;
    if (value != null) {
      result
        ..add('managerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientLocation;
    if (value != null) {
      result
        ..add('clientLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.engineerDept;
    if (value != null) {
      result
        ..add('engineerDept')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clientRep;
    if (value != null) {
      result
        ..add('clientRep')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobDescription;
    if (value != null) {
      result
        ..add('jobDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.engineerName;
    if (value != null) {
      result
        ..add('engineerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.engineerContact;
    if (value != null) {
      result
        ..add('engineerContact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuiltJob deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltJobBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'jobID':
          result.jobID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateAssigned':
          result.dateAssigned = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateCompleted':
          result.dateCompleted = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jobStatus':
          result.jobStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clientName':
          result.clientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clientContact':
          result.clientContact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'managerName':
          result.managerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clientLocation':
          result.clientLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'engineerDept':
          result.engineerDept = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clientRep':
          result.clientRep = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jobDescription':
          result.jobDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'engineerName':
          result.engineerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'engineerContact':
          result.engineerContact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltJob extends BuiltJob {
  @override
  final String? jobID;
  @override
  final String? dateAssigned;
  @override
  final String? dateCompleted;
  @override
  final String? jobStatus;
  @override
  final String? clientName;
  @override
  final String? clientContact;
  @override
  final String? managerName;
  @override
  final String? clientLocation;
  @override
  final String? engineerDept;
  @override
  final String? clientRep;
  @override
  final String? jobDescription;
  @override
  final String? engineerName;
  @override
  final String? engineerContact;

  factory _$BuiltJob([void Function(BuiltJobBuilder)? updates]) =>
      (new BuiltJobBuilder()..update(updates)).build();

  _$BuiltJob._(
      {this.jobID,
      this.dateAssigned,
      this.dateCompleted,
      this.jobStatus,
      this.clientName,
      this.clientContact,
      this.managerName,
      this.clientLocation,
      this.engineerDept,
      this.clientRep,
      this.jobDescription,
      this.engineerName,
      this.engineerContact})
      : super._();

  @override
  BuiltJob rebuild(void Function(BuiltJobBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltJobBuilder toBuilder() => new BuiltJobBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltJob &&
        jobID == other.jobID &&
        dateAssigned == other.dateAssigned &&
        dateCompleted == other.dateCompleted &&
        jobStatus == other.jobStatus &&
        clientName == other.clientName &&
        clientContact == other.clientContact &&
        managerName == other.managerName &&
        clientLocation == other.clientLocation &&
        engineerDept == other.engineerDept &&
        clientRep == other.clientRep &&
        jobDescription == other.jobDescription &&
        engineerName == other.engineerName &&
        engineerContact == other.engineerContact;
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
                                                $jc($jc(0, jobID.hashCode),
                                                    dateAssigned.hashCode),
                                                dateCompleted.hashCode),
                                            jobStatus.hashCode),
                                        clientName.hashCode),
                                    clientContact.hashCode),
                                managerName.hashCode),
                            clientLocation.hashCode),
                        engineerDept.hashCode),
                    clientRep.hashCode),
                jobDescription.hashCode),
            engineerName.hashCode),
        engineerContact.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltJob')
          ..add('jobID', jobID)
          ..add('dateAssigned', dateAssigned)
          ..add('dateCompleted', dateCompleted)
          ..add('jobStatus', jobStatus)
          ..add('clientName', clientName)
          ..add('clientContact', clientContact)
          ..add('managerName', managerName)
          ..add('clientLocation', clientLocation)
          ..add('engineerDept', engineerDept)
          ..add('clientRep', clientRep)
          ..add('jobDescription', jobDescription)
          ..add('engineerName', engineerName)
          ..add('engineerContact', engineerContact))
        .toString();
  }
}

class BuiltJobBuilder implements Builder<BuiltJob, BuiltJobBuilder> {
  _$BuiltJob? _$v;

  String? _jobID;
  String? get jobID => _$this._jobID;
  set jobID(String? jobID) => _$this._jobID = jobID;

  String? _dateAssigned;
  String? get dateAssigned => _$this._dateAssigned;
  set dateAssigned(String? dateAssigned) => _$this._dateAssigned = dateAssigned;

  String? _dateCompleted;
  String? get dateCompleted => _$this._dateCompleted;
  set dateCompleted(String? dateCompleted) =>
      _$this._dateCompleted = dateCompleted;

  String? _jobStatus;
  String? get jobStatus => _$this._jobStatus;
  set jobStatus(String? jobStatus) => _$this._jobStatus = jobStatus;

  String? _clientName;
  String? get clientName => _$this._clientName;
  set clientName(String? clientName) => _$this._clientName = clientName;

  String? _clientContact;
  String? get clientContact => _$this._clientContact;
  set clientContact(String? clientContact) =>
      _$this._clientContact = clientContact;

  String? _managerName;
  String? get managerName => _$this._managerName;
  set managerName(String? managerName) => _$this._managerName = managerName;

  String? _clientLocation;
  String? get clientLocation => _$this._clientLocation;
  set clientLocation(String? clientLocation) =>
      _$this._clientLocation = clientLocation;

  String? _engineerDept;
  String? get engineerDept => _$this._engineerDept;
  set engineerDept(String? engineerDept) => _$this._engineerDept = engineerDept;

  String? _clientRep;
  String? get clientRep => _$this._clientRep;
  set clientRep(String? clientRep) => _$this._clientRep = clientRep;

  String? _jobDescription;
  String? get jobDescription => _$this._jobDescription;
  set jobDescription(String? jobDescription) =>
      _$this._jobDescription = jobDescription;

  String? _engineerName;
  String? get engineerName => _$this._engineerName;
  set engineerName(String? engineerName) => _$this._engineerName = engineerName;

  String? _engineerContact;
  String? get engineerContact => _$this._engineerContact;
  set engineerContact(String? engineerContact) =>
      _$this._engineerContact = engineerContact;

  BuiltJobBuilder();

  BuiltJobBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jobID = $v.jobID;
      _dateAssigned = $v.dateAssigned;
      _dateCompleted = $v.dateCompleted;
      _jobStatus = $v.jobStatus;
      _clientName = $v.clientName;
      _clientContact = $v.clientContact;
      _managerName = $v.managerName;
      _clientLocation = $v.clientLocation;
      _engineerDept = $v.engineerDept;
      _clientRep = $v.clientRep;
      _jobDescription = $v.jobDescription;
      _engineerName = $v.engineerName;
      _engineerContact = $v.engineerContact;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltJob other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuiltJob;
  }

  @override
  void update(void Function(BuiltJobBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltJob build() {
    final _$result = _$v ??
        new _$BuiltJob._(
            jobID: jobID,
            dateAssigned: dateAssigned,
            dateCompleted: dateCompleted,
            jobStatus: jobStatus,
            clientName: clientName,
            clientContact: clientContact,
            managerName: managerName,
            clientLocation: clientLocation,
            engineerDept: engineerDept,
            clientRep: clientRep,
            jobDescription: jobDescription,
            engineerName: engineerName,
            engineerContact: engineerContact);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
