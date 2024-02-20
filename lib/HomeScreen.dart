import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:top_time_show_display/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _timeString;

  Controller controller = Get.put(Controller());


  void initState() {
    _timeString = _formatTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTimeString());
    super.initState();
  }
  _getTimeString() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatTime(now);

    setState(() {
      _timeString = formattedTime;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }



  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        title:Text("Clock "),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue
        ),
      ),
      body:Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(width: 2,color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.8,
                spreadRadius: 5.5,
                offset: Offset(2.5,2.5)
              )
            ],

          ),
          child: Center(
            child: Text("$_timeString",style: TextStyle(
              fontSize: 30,
              color: Colors.white
            ),),
          ),
        ),
      )
    );
  }
}
