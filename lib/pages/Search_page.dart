import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';


class SearchPage extends StatelessWidget {
// SearchPage({Key? key}) : super(key: key );
  SearchPage();
  String? cityName;

  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: ((data) async {
              cityName=data;
             BlocProvider.of<WeatherCubit>(context).cityName=cityName;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName!);
              Navigator.pop(context);
            }),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                hintText: 'Enter City Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                suffixIcon: GestureDetector(
                    onTap: () async {
                    },
                    child: Icon(Icons.search)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                label: Text('search')),
          ),
        ),
      ),
    );
  }
}
