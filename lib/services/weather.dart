import 'package:weather_app/services/networking.dart';
import 'package:weather_app/screens/location_screen.dart';

class WeatherModel {
  Networking networking = Networking();

Future cityweather(city) async{
var response = await networking.getcityweather(city);

return response;
}

Future<dynamic> getlocationweather() async{
    Location location = Location();

    await location.getCurrentLocation();
var response = await networking.getweather(location.latitude, location.longitude);

return response;
}


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '☁️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
