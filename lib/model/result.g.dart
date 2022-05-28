// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      rideType: json['rideType'] as String,
      firstRecommendBoard: Snowboard.fromJson(
          json['firstRecommendBoard'] as Map<String, dynamic>),
      secondRecommendBoard: Snowboard.fromJson(
          json['secondRecommendBoard'] as Map<String, dynamic>),
      discription: json['discription'] as String,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'rideType': instance.rideType,
      'firstRecommendBoard': instance.firstRecommendBoard,
      'secondRecommendBoard': instance.secondRecommendBoard,
      'discription': instance.discription,
    };
