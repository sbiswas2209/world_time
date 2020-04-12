import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location; //location name for UI.
  String time; //time for that location.
  String flag; //url to an asset flag icon
  String url; //location url for api 
  bool isDayTime; //Varuable to check true or false

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
          Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'];
    
    DateTime now = DateTime.parse(dateTime);
    print(now);
    now = now.add(Duration(hours:int.parse(offset.substring(0,3))));
    now = now.add(Duration(minutes: int.parse(offset.substring(4,6))));
    
    
    isDayTime = now.hour >  6 && now.hour< 20 ? true : false;
    
    time = DateFormat.jm().format(now);
  
  
  
  
  
    }
    catch(e){
      print("Caught error : $e");
      time = "Could not get Data.";

    }

  }
}