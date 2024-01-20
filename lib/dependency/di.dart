import 'package:deutschebahn/datasources/train_data_datasource.dart';
import 'package:deutschebahn/services/train_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<TrainDataDatasource>(
      () => TrainDataDatasourceImpl(httpClient: sl.get<http.Client>()));
  sl.registerLazySingleton<TrainService>(
      () => TrainService(trainDataDatasource: sl.get<TrainDataDatasource>()));
}
