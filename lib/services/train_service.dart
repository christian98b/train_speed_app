import 'dart:async';
import 'package:db_models/db_models.dart';
import 'package:deutschebahn/datasources/train_data_datasource.dart';
import 'package:deutschebahn/exceptions/server_exception.dart';

class TrainService {
  final TrainDataDatasource trainDataDatasource;
  bool _listen = false;
  late StreamController<TrainModel> _trainStreamController;

  TrainService({required this.trainDataDatasource}) {
    _trainStreamController = StreamController<TrainModel>.broadcast();
  }

  Stream<TrainModel> get trainStream => _trainStreamController.stream;

  void startListeningToTrain() {
    _listen = true;
    _fetchTrainDataPeriodically();
  }

  void stopListeningToTrain() {
    _listen = false;
    _trainStreamController.close();
  }

  Future<void> _fetchTrainDataPeriodically() async {
    while (_listen) {
      try {
        TrainModel updatedTrain = await trainDataDatasource.get();
        _trainStreamController.add(updatedTrain);
      } catch (e) {
        _trainStreamController.addError(ServerException());
      }
      await Future.delayed(const Duration(seconds: 5));
    }
  }
}
