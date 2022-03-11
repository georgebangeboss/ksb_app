import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ksb_app/chopper_api/serializers.dart';

class BuiltValueConverter extends JsonConverter {
  T _deserialize<T>(dynamic value) {
    return serializers.deserializeWith(
        serializers.serializerForType(T)!, value);
  }

  BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(
        value.map((value) => _deserialize<T>(value)).toList(growable: false),
      );

  dynamic _decode<T>(entity) {
    if (entity is T) return entity;

    try {
      if (entity is List) return _deserializeListOf<T>(entity);
      return _deserialize<T>(entity);
    } catch (e) {
      return null;
    }
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json

    // if dynamic is an iterable, then the body is iterable<Item>
    // if the dynamic is a map, then the body is Map<String,Item>

    //in the case of a json object map
    // response is Response<dynamic>  and  response.body => Map<String,Item>

    //in case of a json object iterable
    //response is Response<dynamic>  and  response.body => Iterable<Item>

    //otherwise Response<dynamic>, response.body is just as it was

    final jsonRes = super.convertResponse(response);

    //if response.body is Item
    //the new response.body =Item

    //If response.body is a List
    //then new response.body=BuiltList<Item> from serializer

    //otherwise
    //the new response=Item from serializer

    var body = jsonRes.body;
    if (jsonRes.body is! Map<String, Item>) {
      body = _decode<Item>(jsonRes.body);
    }

    return jsonRes.copyWith<ResultType>(body: body);
  }

  @override
  Request convertRequest(Request request) {
    if (request.body is! Map) {
      request = request.copyWith(
        body: serializers.serializeWith(
            serializers.serializerForType(request.body.runtimeType)!,
            request.body),
      );
    }
    Request processedRequest = super.convertRequest(request);

    // http.MultipartFile file = processedRequest.parts.first.value.first;
    // print(file.field);
    // print(file.filename);
    // print(file.contentType);
    // print(file.length);

    return processedRequest;
  }
}
