import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/Cubit/weather_cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_services_page.dart';


void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServices());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel== null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getColorThem(),
      ),
      home: HomePage(),
    );
  }
}


