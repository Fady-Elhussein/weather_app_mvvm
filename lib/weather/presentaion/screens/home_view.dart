import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/getweather_cubit/getweather_cubit.dart';
import '../controller/cubit/getweather_states/getweather_states.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            icon: const Icon(Icons.search_sharp),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is InitialWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherSuccessState) {
            return const WeatherInfoBody();
          } else if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
                value: 50,
              ),
            );
          } else {
            return const Text("Opps there was an error");
          }
        },
      ),
    );
  }
}
