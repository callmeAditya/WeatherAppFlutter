import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';

const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

//https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var lat;
  var long;
  var temp;
  var city;
  var feels_like;


  void getdata() async{


var data  = await WeatherModel().getlocationweather();

Navigator.push(context, MaterialPageRoute(builder: (context){
  return LocationScreen(locationWeather: data,);
}));


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getdata();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
