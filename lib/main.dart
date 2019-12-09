import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/pages/choose_locations.dart';
import 'package:world_time_flutter_app/pages/home.dart';
import 'package:world_time_flutter_app/pages/loading.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  },
));
