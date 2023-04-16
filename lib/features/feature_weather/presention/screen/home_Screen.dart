import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/widgets/app_backgrand.dart';
import 'package:flutter_weather_app/core/widgets/dot_loading.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_weather_app/features/feature_weather/presention/bloc/cw_status.dart';
import 'package:flutter_weather_app/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String cityName = 'Shiraz';
  final PageController _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state.cwStatus is CwLoading) {
              return const Expanded(child: DotLoadingWidget());
            }

            if (state.cwStatus is CwCompleted) {
              final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
              CurrentCityEntity currentCityEntity =
                  cwCompleted.currentCityEntity;

              return Expanded(
                child: ListView(
                  children: [

                    Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                      child: SizedBox(
                        width: width,
                        height: 400,
                        child: PageView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          allowImplicitScrolling: true,
                          controller: _pageController,
                          itemCount: 2,
                          itemBuilder: (context,position){
                            if(position == 0){
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: Text(
                                      currentCityEntity.name!,
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      currentCityEntity.weather![0].description!,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: AppBackground.setIconForMain(
                                        currentCityEntity.weather![0].description),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      '${currentCityEntity.main!.temp!.round().toString()}\u00B0',
                                      style: const TextStyle(
                                          fontSize: 40, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Max',
                                            style: TextStyle(
                                                fontSize: 12, color: Colors.grey),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${currentCityEntity.main!.tempMax!.round().toString()}\u00B0',
                                            style: const TextStyle(
                                                fontSize: 12, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          height: 40,
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Min',
                                            style: TextStyle(
                                                fontSize: 12, color: Colors.grey),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${currentCityEntity.main!.tempMin!.round().toString()}\u00B0',
                                            style: const TextStyle(
                                                fontSize: 12, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }else{
                              return Container(
                                color: Colors.amber,
                              );
                            }

                          },
                        ),
                      ),
                    ),
                   const SizedBox(height: 10),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 2,
                        effect:const ExpandingDotsEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            spacing: 5,
                            activeDotColor: Colors.white,
                        ),
                        onDotClicked: (index){
                            _pageController.animateToPage(index,
                                duration: const Duration(microseconds: 500),
                                curve: Curves.bounceOut,
                            );
                        },
                      ),
                    )





                  ],
                ),
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
