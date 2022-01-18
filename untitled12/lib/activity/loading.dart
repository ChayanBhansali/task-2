import 'package:flutter/material.dart';
import 'package:untitled1/activity/worker.dart';
class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String temp = '';
  String desc = '';
  String city= 'jaipur';
  void appStart() async {
  worker instance = worker(location: city);
  await instance.getData();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    "temp_value" : instance.temp,
    "desc_value" : instance.description,
    "location_value" : instance.location
  });
  }
  @override
  void initState() {
    super.initState();
    appStart();
  }

  @override
  Widget build(BuildContext context) {
Map search = ModalRoute.of(context)?.settings.arguments as Map;
if(search.isNotEmpty ?? false)
{
  city = search['searchText'];
}


    return Scaffold(
      appBar: AppBar(
        title: Text(''),

      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 200,),
            Text("WEATHER APP",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,

            ),
            ),
            Text("loading",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
