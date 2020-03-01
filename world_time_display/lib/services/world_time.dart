import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String url; //location for api
  bool isDayTime;

  WorldTime({ this.location , this.flag,this.url}); //constructor

  Future<void> getTime() async {
    //fetching time from api

    try{
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);

      //extract required properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //creating datetime object
      DateTime time_now = DateTime.parse(datetime);
      time_now = time_now.add(Duration(hours:int.parse(offset)));

      isDayTime = (time_now.hour > 6 && time_now.hour < 19) ? true: false;

      time = DateFormat.jm().format(time_now);
    }
    catch(e){
      print('Cant load:$e');
      time = 'Could not get it';
    }



  }
}

