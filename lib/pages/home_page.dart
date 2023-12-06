import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/Cubit/weather_cubit.dart';
import 'package:weather_app/Cubit/weather_state.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/Search_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              }),
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSucsses) {
            WeatherModel? weatherData=BlocProvider.of<WeatherCubit>(context).weatherModel!;
            return SuccessBody(weatherData:weatherData );
          } else if (state is WeatherFailure) {
            return Center(
              child: Text('Something went be wrong'),
            );
          } else {
            return InitialBody();
          }
        },
      ),
    );
  }
}

class InitialBody extends StatelessWidget {
  const InitialBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  SuccessBody({
    super.key,
    required this.weatherData,
  });

   WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getColorThem(),
          weatherData!.getColorThem()[300]!,
          weatherData!.getColorThem()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            'Updated at: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()} ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp.toInt().toString(),
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Column(
                children: [
                  Text('max Temp: ${weatherData!.maxTemp.toInt()}'),
                  Text('min Temp: ${weatherData!.minTemp.toInt()}'),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            weatherData!.weatherStateName,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
