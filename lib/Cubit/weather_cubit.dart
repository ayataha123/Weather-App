import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';

import '../services/weather_services_page.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit( this.service) : super(WeatherIntial());
  WeatherServices service ;
  WeatherModel ?weatherModel;
  String? cityName;
  void getWeather(String cityName) async {
    emit(WeatherLoading());
    try {
    weatherModel=  await service.getServices(cityName: cityName);
      emit(WeatherSucsses( ));
    // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
