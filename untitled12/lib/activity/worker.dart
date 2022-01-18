import 'package:http/http.dart';
import 'dart:convert';
class worker {
  String temp = '';
  String location = '';
  worker({required this.location}){
  location = this.location;
  }
  String description = '';
  Future<void> getData() async
  {
    try{
      Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=58d7c230adc53bc1097e16ca7c38385c'));
      Map data = jsonDecode(response.body);

      //getting temperature
      Map tempData = data['main'];
      double getTemp = tempData['temp'];
      temp = getTemp.toString();

      //getting description
      List descData = data['weather'];
      Map getWeather= descData[0];
      String getDesc = getWeather["description"];
      description = getDesc;
    }catch(e) {
      temp = 'error occurred';
      description = '-' ;
    }

  }




}