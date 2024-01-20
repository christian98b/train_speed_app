// To parse this JSON data, do
//
//     final trainModel = trainModelFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'train_model.g.dart';

TrainModel trainModelFromJson(String str) =>
    TrainModel.fromJson(json.decode(str));

String trainModelToJson(TrainModel data) => json.encode(data.toJson());

@JsonSerializable()
class TrainModel extends Equatable {
  @JsonKey(name: "connection")
  bool connection;
  @JsonKey(name: "serviceLevel")
  String serviceLevel;
  @JsonKey(name: "gpsStatus")
  String gpsStatus;
  @JsonKey(name: "internet")
  String internet;
  @JsonKey(name: "latitude")
  double latitude;
  @JsonKey(name: "longitude")
  double longitude;
  @JsonKey(name: "tileY")
  int tileY;
  @JsonKey(name: "tileX")
  int tileX;
  @JsonKey(name: "series")
  String series;
  @JsonKey(name: "serverTime")
  int serverTime;
  @JsonKey(name: "speed")
  int speed;
  @JsonKey(name: "trainType")
  String trainType;
  @JsonKey(name: "tzn")
  String tzn;
  @JsonKey(name: "wagonClass")
  String wagonClass;
  @JsonKey(name: "connectivity")
  Connectivity connectivity;
  @JsonKey(name: "bapInstalled")
  bool bapInstalled;

  TrainModel({
    required this.connection,
    required this.serviceLevel,
    required this.gpsStatus,
    required this.internet,
    required this.latitude,
    required this.longitude,
    required this.tileY,
    required this.tileX,
    required this.series,
    required this.serverTime,
    required this.speed,
    required this.trainType,
    required this.tzn,
    required this.wagonClass,
    required this.connectivity,
    required this.bapInstalled,
  });

  TrainModel copyWith({
    bool? connection,
    String? serviceLevel,
    String? gpsStatus,
    String? internet,
    double? latitude,
    double? longitude,
    int? tileY,
    int? tileX,
    String? series,
    int? serverTime,
    int? speed,
    String? trainType,
    String? tzn,
    String? wagonClass,
    Connectivity? connectivity,
    bool? bapInstalled,
  }) =>
      TrainModel(
        connection: connection ?? this.connection,
        serviceLevel: serviceLevel ?? this.serviceLevel,
        gpsStatus: gpsStatus ?? this.gpsStatus,
        internet: internet ?? this.internet,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        tileY: tileY ?? this.tileY,
        tileX: tileX ?? this.tileX,
        series: series ?? this.series,
        serverTime: serverTime ?? this.serverTime,
        speed: speed ?? this.speed,
        trainType: trainType ?? this.trainType,
        tzn: tzn ?? this.tzn,
        wagonClass: wagonClass ?? this.wagonClass,
        connectivity: connectivity ?? this.connectivity,
        bapInstalled: bapInstalled ?? this.bapInstalled,
      );

  factory TrainModel.fromJson(Map<String, dynamic> json) =>
      _$TrainModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainModelToJson(this);

  @override
  List<Object?> get props => [
        connection,
        serviceLevel,
        gpsStatus,
        internet,
        latitude,
        longitude,
        tileY,
        tileX,
        series,
        serverTime,
        speed,
        trainType,
        tzn,
        wagonClass,
        connectivity,
        bapInstalled,
      ];
}

@JsonSerializable()
class Connectivity extends Equatable {
  @JsonKey(name: "currentState")
  String currentState;
  @JsonKey(name: "nextState")
  String nextState;
  @JsonKey(name: "remainingTimeSeconds")
  int remainingTimeSeconds;

  Connectivity({
    required this.currentState,
    required this.nextState,
    required this.remainingTimeSeconds,
  });

  Connectivity copyWith({
    String? currentState,
    String? nextState,
    int? remainingTimeSeconds,
  }) =>
      Connectivity(
        currentState: currentState ?? this.currentState,
        nextState: nextState ?? this.nextState,
        remainingTimeSeconds: remainingTimeSeconds ?? this.remainingTimeSeconds,
      );

  factory Connectivity.fromJson(Map<String, dynamic> json) =>
      _$ConnectivityFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectivityToJson(this);

  @override
  List<Object?> get props => [currentState, nextState, remainingTimeSeconds];
}
