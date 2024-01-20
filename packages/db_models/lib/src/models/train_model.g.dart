// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainModel _$TrainModelFromJson(Map<String, dynamic> json) => TrainModel(
      connection: json['connection'] as bool,
      serviceLevel: json['serviceLevel'] as String,
      gpsStatus: json['gpsStatus'] as String,
      internet: json['internet'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      tileY: json['tileY'] as int,
      tileX: json['tileX'] as int,
      series: json['series'] as String,
      serverTime: json['serverTime'] as int,
      speed: json['speed'] as int,
      trainType: json['trainType'] as String,
      tzn: json['tzn'] as String,
      wagonClass: json['wagonClass'] as String,
      connectivity:
          Connectivity.fromJson(json['connectivity'] as Map<String, dynamic>),
      bapInstalled: json['bapInstalled'] as bool,
    );

Map<String, dynamic> _$TrainModelToJson(TrainModel instance) =>
    <String, dynamic>{
      'connection': instance.connection,
      'serviceLevel': instance.serviceLevel,
      'gpsStatus': instance.gpsStatus,
      'internet': instance.internet,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tileY': instance.tileY,
      'tileX': instance.tileX,
      'series': instance.series,
      'serverTime': instance.serverTime,
      'speed': instance.speed,
      'trainType': instance.trainType,
      'tzn': instance.tzn,
      'wagonClass': instance.wagonClass,
      'connectivity': instance.connectivity,
      'bapInstalled': instance.bapInstalled,
    };

Connectivity _$ConnectivityFromJson(Map<String, dynamic> json) => Connectivity(
      currentState: json['currentState'] as String,
      nextState: json['nextState'] as String,
      remainingTimeSeconds: json['remainingTimeSeconds'] as int,
    );

Map<String, dynamic> _$ConnectivityToJson(Connectivity instance) =>
    <String, dynamic>{
      'currentState': instance.currentState,
      'nextState': instance.nextState,
      'remainingTimeSeconds': instance.remainingTimeSeconds,
    };
