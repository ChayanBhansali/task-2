

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
Map info = {};
TextEditingController searchcontroller = new TextEditingController();
String temp = 'search location';

  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

 info = ModalRoute.of(context)?.settings.arguments as Map;

 return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                padding: EdgeInsets.all(8),
                child: Row(
                  children:  [
                   GestureDetector(
                     onTap: () {
                       Navigator.pushNamed(context, '/loading', arguments: {
                         "searchText" : searchcontroller.text,
                       });
                     },
                     child:Icon(Icons.search),
                   ),
                    Expanded(
                      child: TextField(
                        controller: searchcontroller,
                        decoration: InputDecoration(
                          hintText: "search any city",

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(temp),
              SizedBox(height: 25,),
              Text(info['location_value'] + ' temperature is ' + info['temp_value']  + " kelvin"),
            ],
          ),
        ),
      ),
    );
  }
}
