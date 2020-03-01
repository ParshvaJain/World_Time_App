import 'package:flutter/material.dart';
import 'package:world_time_display/pages/choose_locations.dart';
import 'package:world_time_display/pages/home.dart';
import 'package:world_time_display/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location' : (context) => ChooseLocation(),
  }
));

