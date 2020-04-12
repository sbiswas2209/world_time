import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    print(instance.time);
    Navigator.pushReplacementNamed(context, '/home' ,arguments:{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime
    });
  }



 void initState() {
    super.initState();
    print('initState() function run.');
    setupWorldTime();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body : Center(
        child: SpinKitCubeGrid(
          itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
          decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },  
  ),
      ),
    );
  }
}