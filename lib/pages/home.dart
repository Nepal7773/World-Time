import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty ? data :(ModalRoute.of(context)?.settings.arguments ?? <dynamic,dynamic>{}) as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.jpg' :'night.jpeg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];
    return Scaffold(
      backgroundColor: bgColor!,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,100.0,0,0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : result['time'],
                       'isDayTime': result['isDayTime'],
                       'location': result['location'],
                       'flag' : result['flag'],
                    };
                  });
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                     ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 70.0,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
    );
  }
}