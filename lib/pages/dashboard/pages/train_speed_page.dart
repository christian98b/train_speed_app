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
  final TrainService trainService = sl.get<TrainService>();

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
                    Text("${snapshot.data?.tzn}"),
                    Lottie.asset(
                      'assets/lottie/train.json',
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Geschwindigkeit"),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${snapshot.data?.speed} km/h',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    ),
                  ]);
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
              })),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
