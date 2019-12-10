import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url  for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //Make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      //get prop from data
      String datetime = data['datetime'];
      //String offset = data['utc_offset'];
      //print(' date ---> $datetime - $offset');

      //get offset
      String offset = data['utc_offset'].substring(1, 3);

      //Create date time object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print('time in London is $now');

      //set time prop
      time = now.toString();
    } catch (e) {
      print('caught error: $e');
      time = "try again later";
    }
  }
}

//WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png', url: 'Europe/Berlin');
