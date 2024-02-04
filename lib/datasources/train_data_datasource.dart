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
    final headers = {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0',
      'Accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
      'Accept-Language': 'de,en-US;q=0.7,en;q=0.3',
      'Accept-Encoding': 'gzip, deflate, br',
      'Upgrade-Insecure-Requests': '1',
      'Sec-Fetch-Dest': 'document',
      'Sec-Fetch-Mode': 'navigate',
      'Sec-Fetch-Site': 'none',
      'Sec-Fetch-User': '?1',
    };
    final response = await httpClient.get(uri, headers: headers);

    if (response.statusCode != 200) {
      throw ServerException(error: response.body);
    }

    return TrainModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<TrainModel> testGet() {
    final List<TrainModel> trainList =
        trainTestData.map((e) => TrainModel.fromJson(e)).toList();

    final random = Random();
    final randomIndex = random.nextInt(trainList.length);
    final randomElement = trainList[randomIndex];

    return Future.value(randomElement);
  }
}
