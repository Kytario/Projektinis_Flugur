import 'package:easy_localization/easy_localization.dart';
import 'package:weatherapp_starter_project/api/api_key.dart';

String apiURL(lat, lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=" +
          'languagecode'.tr().toString() +
          "&exclude=minutely,alerts";
  print(url);
  return url;
}
