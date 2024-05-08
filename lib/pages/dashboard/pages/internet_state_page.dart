import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../dependency/di.dart';
import '../../../services/train_service.dart';

@RoutePage()
class InternetStatePage extends StatefulWidget {
  const InternetStatePage({super.key});

  @override
  State<InternetStatePage> createState() => _InternetStatePageState();
}

class _InternetStatePageState extends State<InternetStatePage> {
  TrainService trainService = sl.get<TrainService>();

  @override
  void initState() {
    super.initState();
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
                  return Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(height: 20.0),
                          Text(
                              'Aktuelles Internetgeschwindigkeit: ${snapshot.data!.connectivity?.currentState}',
                              style: Theme.of(context).textTheme.bodyLarge),
                          Text(
                              'Verbleibend für: ${snapshot.data!.connectivity?.remainingTimeSeconds} Sekunden'),
                          Text(
                              'Nächste Internetgeschwindigkeit: ${snapshot.data!.connectivity?.nextState}')
                        ]),
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
