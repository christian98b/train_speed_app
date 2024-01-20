import 'package:auto_route/auto_route.dart';
import 'package:deutschebahn/router/router.gr.dart';
import 'package:flutter/material.dart';

class DashboardNavigationDrawer extends StatefulWidget {
  const DashboardNavigationDrawer({super.key});

  @override
  State<DashboardNavigationDrawer> createState() =>
      _DashboardNavigationDrawerState();
}

class _DashboardNavigationDrawerState extends State<DashboardNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        TrainSpeedRoute(),
        InternetStateRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.train), label: "Zuggeschwindigkeit"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wifi_rounded),
                label: "Netzwerkgeschwindigkeit"),
          ],
        );
      },
    );
  }
}
