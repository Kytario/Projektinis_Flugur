import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

import '../utils/theme_provider.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

// String manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 59.h,
        margin: EdgeInsets.all(0.35.dp),
        padding: EdgeInsets.all(0.30.dp),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
            borderRadius: BorderRadius.circular(25)),
        child: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(bottom: 0.3.dp, left: 0.09.dp, top: 0.09.dp),
            child: Text("next_days".tr().toString(),
                style: TextStyle(fontSize: 0.4.dp, fontFamily: 'SfPro')),
          ),
          dailyList(),
        ]));
  }

  Widget dailyList() {
    return SizedBox(
        height: 48.h,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: weatherDataDaily.daily.length > 7
                ? 7
                : weatherDataDaily.daily.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.dividerLine
                        : Colors.grey.shade400,
                  ),
                  Container(
                      height: 7.h,
                      padding: EdgeInsets.only(left: 0.1.dp, right: 0.1.dp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 34.w,
                            child: Text(
                              getDay(weatherDataDaily.daily[index].dt),
                              style: TextStyle(
                                  fontFamily: 'SfPro', fontSize: 0.33.dp),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                            width: 7.w,
                            child: Image.asset(Theme.of(context).brightness ==
                                    Brightness.dark
                                ? "assets/weather/light/${weatherDataDaily.daily[index].weather![0].icon}.png"
                                : "assets/weather/dark/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                          ),
                          Text(
                              "${weatherDataDaily.daily[index].temp!.min}° / ${weatherDataDaily.daily[index].temp!.max}°",
                              style: TextStyle(fontSize: 0.3.dp))
                        ],
                      )),
                ],
              );
            }));
  }
}
