// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snowboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Snowboard _$$_SnowboardFromJson(Map<String, dynamic> json) => _$_Snowboard(
      name: json['name'] as String,
      descprition: json['descprition'] as String,
      imageUrl: json['imageUrl'] as String,
      chartData: (json['chartData'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_SnowboardToJson(_$_Snowboard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'descprition': instance.descprition,
      'imageUrl': instance.imageUrl,
      'chartData': instance.chartData,
    };
