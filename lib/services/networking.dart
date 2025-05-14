import 'package:http/http.dart';
import 'package:weather_app/utilities/constants.dart';
import 'dart:convert' as convert;


class Networking{

  Future getcityweather(city) async{
    var url = Uri.https('api.openweathermap.org','/data/2.5/weather',{'q':'${city}','appid':'${apiid}','units':'metric'});
var response = await get(url);
if(response.statusCode == 200){
  var jsonResponse = convert.jsonDecode(response.body);
  var temp = jsonResponse['main']['temp']  ;
    print(temp);
    return jsonResponse;
}
else{
  return {};
}
  }
  

  Future getweather(lat, long) async{
    var url = Uri.https('api.openweathermap.org','/data/2.5/weather',{'lat':'${lat}', 'lon':'${long}', 'appid':'${apiid}','units':'metric'});

var response = await get(url);
if(response.statusCode == 200){
  var jsonResponse = convert.jsonDecode(response.body);
  var temp = jsonResponse['main']['temp']  ;
    print(temp);
    return jsonResponse;
}
else{
  return {};
}
  }
}