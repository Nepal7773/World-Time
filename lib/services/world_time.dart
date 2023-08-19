import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; //location name of UI
  String? time; //time in that location
  String? flag; // url to an assets flag icon
  String? url; // location url for api endpoint
  bool? isDayTime; // day or not

  WorldTime({this.location, this.flag, this.url});
  
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      print(isDayTime);
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("cought Error : $e");
      time = 'could not get time data';
    }
  }
}
