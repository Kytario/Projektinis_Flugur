import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/utils/theme_provider.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin:
                const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
            child: Text("comfort_level".tr().toString(),
                style: TextStyle(fontSize: 0.33.dp, fontFamily: 'SfPro'))),
        SizedBox(
          height: 21.h,
          child: Column(
            children: [
              Center(
                  child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 3.w, progressBarWidth: 3.w),
                    infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 0.39.dp),
                        bottomLabelText: "humidity".tr().toString(),
                        bottomLabelStyle: const TextStyle(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            height: 1.5,
                            fontFamily: 'SfPro')),
                    animationEnabled: true,
                    size: 0.88.dp,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomColors.firstGradientColor.withAlpha(100),
                        progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ])),
              )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "feels_like".tr().toString(),
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 0.30.dp,
                          height: 0.8,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SfPro')),
                  TextSpan(
                      text: "${weatherDataCurrent.current.feelsLike}°",
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 0.30.dp,
                          height: 0.8,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SfPro')),
                ])),
                Container(
                  height: 25,
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  width: 1,
                  color: CustomColors.dividerLine,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "uv".tr().toString(),
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 0.30.dp,
                          height: 0.8,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SfPro')),
                  TextSpan(
                      text: "${weatherDataCurrent.current.uvIndex}",
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 0.30.dp,
                          height: 0.8,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SfPro')),
                ])),
              ])
            ],
          ),
        )
      ],
    );
  }
}
