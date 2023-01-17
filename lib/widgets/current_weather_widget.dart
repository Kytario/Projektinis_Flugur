import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

import '../utils/theme_provider.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? "assets/weather/maind/${weatherDataCurrent.current.weather![0].icon}.png"
              : "assets/weather/mainn/${weatherDataCurrent.current.weather![0].icon}.png",
          width: 40.w,
          height: 40.h),
      SizedBox(height: 0.01.h),
      RichText(
        text: TextSpan(
            text: "${weatherDataCurrent.current.temp!.toInt()}°C",
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : CustomColors.textColorBlack,
                fontFamily: 'ApronSoft',
                fontWeight: FontWeight.w600,
                fontSize: 0.7.dp)),
      ),
      RichText(
        text: TextSpan(
            text: "${weatherDataCurrent.current.weather![0].description}",
            style: TextStyle(
              fontFamily: 'ApronSoft',
              fontWeight: FontWeight.w400,
              fontSize: 0.40.dp,
              color: Colors.grey,
            )),
      ),
      SizedBox(height: 1.09.dp),
      currentWeatherMoreDetailsWidget(),
    ]);
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.windSpeed} km/h",
              style: TextStyle(fontSize: 12, fontFamily: 'SfPro'),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.clouds}%",
              style: TextStyle(fontSize: 12, fontFamily: 'SfPro'),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.humidity}%",
              style: TextStyle(fontSize: 12, fontFamily: 'SfPro'),
              textAlign: TextAlign.center,
            ),
          ),
        ])
      ],
    );
  }
}
