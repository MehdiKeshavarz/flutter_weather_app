import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/features/feature_weather/presention/bloc/home_bloc.dart';

import 'core/widgets/main_wrapper.dart';
import 'locator.dart';

void main() async {
  await setup();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: true,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => locator<HomeBloc>()),
          ],
          child: MainWrapper(),
        )),
  );
}
