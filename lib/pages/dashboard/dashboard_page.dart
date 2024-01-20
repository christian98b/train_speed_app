import 'package:auto_route/auto_route.dart';
import 'package:deutschebahn/pages/dashboard/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardNavigationDrawer();
  }
}
