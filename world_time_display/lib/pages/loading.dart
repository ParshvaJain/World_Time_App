import 'package:flutter/material.dart';
import 'package:world_time_display/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime wt1 = WorldTime(location: 'Berlin',flag:'germany.png',url:'Europe/Berlin');
    await wt1.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': wt1.location,
      'flag': wt1.flag,
      'time': wt1.time,
      'isDayTime':wt1.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child:SpinKitDualRing(
            color: Colors.white,
            size: 90.0,
          ),
      ),
    );
  }
}
