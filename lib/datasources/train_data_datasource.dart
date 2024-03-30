import 'dart:convert';
import 'dart:math';

import 'package:deutschebahn/exceptions/server_exception.dart';
import 'package:deutschebahn/test_data/train_model_testdata.dart';
import 'package:http/http.dart' as http;

import 'package:db_models/db_models.dart';

abstract class TrainDataDatasource {
  Future<TrainModel> get();
  Future<TrainModel> testGet();
}

class TrainDataDatasourceImpl extends TrainDataDatasource {
  http.Client httpClient;

  TrainDataDatasourceImpl({required this.httpClient});

  @override
  Future<TrainModel> get() async {
    Uri uri = Uri.parse('https://iceportal.de/api1/rs/status');
    final response = await httpClient.get(uri);
    final Map<String, String> headers = {
      'content-type': 'application/json;charset=utf-8',
    };
    if (response.statusCode != 200) {
      throw ServerException(error: response.body);
    }

    return TrainModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<TrainModel> testGet() {
    try {
      final List<TrainModel> trainList =
          trainTestData.map((e) => TrainModel.fromJson(e)).toList();

      final random = Random();
      final randomIndex = random.nextInt(trainList.length);
      final randomElement = trainList[randomIndex];

      return Future.value(randomElement);
    } catch (e) {
      print(e);
      throw ServerException(error: e.toString());
    }
  }
}
