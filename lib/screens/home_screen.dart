import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:get/get.dart' hide Trans;
import 'package:weatherapp_starter_project/screens/testing.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/widgets/comfort_level.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/daily_data_forecast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call the provider
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => globalController.checkLoading().isTrue
            ? Center(
                child: Image.asset(
                  "assets/icons/loading.gif",
                  scale: 0.8,
                ),
              )
            : Center(
                child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(),
                  const HeaderWidget(),
                  // for our current temp
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getData().getCurrentWeather(),
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getData().getHourlyWeather()),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  DailyDataForecast(
                    weatherDataDaily:
                        globalController.getData().getDailyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ComfortLevel(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather()),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRightWithFade,
                                child: Main()));
                      },
                      child: Text('settings'.tr().toString()))
                ],
              )),
      )),
    );
  }
}
