import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Counter'),
      actions: [
        IconButton(
          onPressed: () {
            context.read<ApplicationStartCubit>().updateThemeMode(
              Theme.brightnessOf(context) == .light
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
          icon: Icon(
            Theme.brightnessOf(context) == .light
                ? TablerIcons.moon
                : TablerIcons.sun,
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => setState(() => _count++),
      child: const Icon(TablerIcons.plus),
    ),
    body: Center(child: Text('Count: $_count')),
  );
}
