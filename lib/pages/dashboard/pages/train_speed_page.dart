import 'package:auto_route/auto_route.dart';
import 'package:deutschebahn/dependency/di.dart';
import 'package:deutschebahn/services/train_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class TrainSpeedPage extends StatefulWidget {
  const TrainSpeedPage({Key? key}) : super(key: key);

  @override
  State<TrainSpeedPage> createState() => _TrainSpeedPageState();
}

class _TrainSpeedPageState extends State<TrainSpeedPage> {
  double speed = 20;
  final TrainService trainService = sl.get<TrainService>();
  late Stream trainStream;

  @override
  void initState() {
    super.initState();
    trainService.startListeningToTrain();
  }

  @override
  void dispose() {
    super.dispose();
    trainService.stopListeningToTrain();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: trainService.trainStream,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    Text("${snapshot.data!.tzn}"),
                    Lottie.asset(
                      'assets/lottie/train.json',
                    ),
                    const SizedBox(height: 20.0),
                    Text('Geschwindigkeit: ${snapshot.data!.speed} km/h',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ]);
                } else {
                  return const Text("Ein Fehler ist aufgetreten");
                }
              })),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
