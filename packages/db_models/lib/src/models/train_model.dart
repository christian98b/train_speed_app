// To parse this JSON data, do
//
//     final trainModel = trainModelFromJson(jsonString);

import 'dart:convert';

TrainModel trainModelFromJson(String str) =>
    TrainModel.fromJson(json.decode(str));

String trainModelToJson(TrainModel data) => json.encode(data.toJson());

class TrainModel {
  final bool connection;
  final String serviceLevel;
  final String gpsStatus;
  final String internet;
  final double latitude;
  final double longitude;
  final int tileY;
  final int tileX;
  final String series;
  final int serverTime;
  final double speed;
  final String trainType;
  final String tzn;
  final String wagonClass;
  final Connectivity connectivity;
  final bool bapInstalled;

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
    double? speed,
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

  factory TrainModel.fromJson(Map<String, dynamic> json) => TrainModel(
        connection: json["connection"],
        serviceLevel: json["serviceLevel"],
        gpsStatus: json["gpsStatus"],
        internet: json["internet"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        tileY: json["tileY"],
        tileX: json["tileX"],
        series: json["series"],
        serverTime: json["serverTime"],
        speed: json["speed"],
        trainType: json["trainType"],
        tzn: json["tzn"],
        wagonClass: json["wagonClass"],
        connectivity: Connectivity.fromJson(json["connectivity"]),
        bapInstalled: json["bapInstalled"],
      );

  Map<String, dynamic> toJson() => {
        "connection": connection,
        "serviceLevel": serviceLevel,
        "gpsStatus": gpsStatus,
        "internet": internet,
        "latitude": latitude,
        "longitude": longitude,
        "tileY": tileY,
        "tileX": tileX,
        "series": series,
        "serverTime": serverTime,
        "speed": speed,
        "trainType": trainType,
        "tzn": tzn,
        "wagonClass": wagonClass,
        "connectivity": connectivity.toJson(),
        "bapInstalled": bapInstalled,
      };
}

class Connectivity {
  final String currentState;
  final String nextState;
  final int remainingTimeSeconds;

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

  factory Connectivity.fromJson(Map<String, dynamic> json) => Connectivity(
        currentState: json["currentState"],
        nextState: json["nextState"],
        remainingTimeSeconds: json["remainingTimeSeconds"],
      );

  Map<String, dynamic> toJson() => {
        "currentState": currentState,
        "nextState": nextState,
        "remainingTimeSeconds": remainingTimeSeconds,
      };
}
