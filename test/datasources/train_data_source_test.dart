import 'dart:convert';

import 'package:db_models/db_models.dart';
import 'package:deutschebahn/datasources/train_data_datasource.dart';
import 'package:deutschebahn/exceptions/server_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'train_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("Train Data Source Test", () {
    test('Test if response is TrainModel', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://iceportal.de/api1/rs/status')))
          .thenAnswer((_) async => http.Response(
              jsonEncode({
                "connection": true,
                "serviceLevel": "AVAILABLE_SERVICE",
                "gpsStatus": "VALID",
                "internet": "HIGH",
                "latitude": 52.805313,
                "longitude": 9.233282,
                "tileY": 311,
                "tileX": -27,
                "series": "411",
                "serverTime": 1705243105314,
                "speed": 149,
                "trainType": "ICE",
                "tzn": "ICE1112",
                "wagonClass": "SECOND",
                "connectivity": {
                  "currentState": "WEAK",
                  "nextState": "UNSTABLE",
                  "remainingTimeSeconds": 1200
                },
                "bapInstalled": true
              }),
              200));

      final result = await TrainDataDatasourceImpl(httpClient: client).get();
      expect(
          result,
          TrainModel.fromJson(const {
            "connection": true,
            "serviceLevel": "AVAILABLE_SERVICE",
            "gpsStatus": "VALID",
            "internet": "HIGH",
            "latitude": 52.805313,
            "longitude": 9.233282,
            "tileY": 311,
            "tileX": -27,
            "series": "411",
            "serverTime": 1705243105314,
            "speed": 149,
            "trainType": "ICE",
            "tzn": "ICE1112",
            "wagonClass": "SECOND",
            "connectivity": {
              "currentState": "WEAK",
              "nextState": "UNSTABLE",
              "remainingTimeSeconds": 1200
            },
            "bapInstalled": true
          }));
    });

    test("Throw error if Response is not 200", () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://iceportal.de/api1/rs/status')))
          .thenAnswer((_) async => http.Response('', 401));

      try {
        await TrainDataDatasourceImpl(httpClient: client).get();
      } catch (e) {
        expect(e is ServerException, true);
      }
    });
  });
}
