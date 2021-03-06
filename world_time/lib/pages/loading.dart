import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // make the request
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);
    print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    print(datetime);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    print('test2');

    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
    print('test');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen'),
    );
  }
}
