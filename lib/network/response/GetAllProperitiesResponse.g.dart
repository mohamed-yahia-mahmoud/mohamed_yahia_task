// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAllProperitiesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProperitiesResponse _$GetAllProperitiesResponseFromJson(
    Map<String, dynamic> json) {
  return GetAllProperitiesResponse(
     data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ProperityModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
   );
}

Map<String, dynamic> _$GetAllProperitiesResponseToJson(
    GetAllProperitiesResponse instance) =>
    <String, dynamic>{
       'data': instance.data,
     };
