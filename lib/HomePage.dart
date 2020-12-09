import 'package:busyclock/ClockView.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(now);
    var timezonezstring = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezonezstring.startsWith("-")) offsetSign = '+';
    print(timezonezstring);

    return Scaffold(
      backgroundColor: Color(0xff2d2f41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      FlutterLogo(),
                      Text(
                        'Clock',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ))
            ],
          ),
          VerticalDivider(
            color: Colors.black,
            width: 1,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.center,
                color: Color(0xff2d2f41),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "clock",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Clockview(),
                    Text(
                      "TimeZone",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "UTC",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
