import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    getWeather();
    super.initState();
  }

  var iconId,temperature,description,currentCityName;
  TextEditingController cityNameController = new TextEditingController();



  getWeather() async{
    print("clicked");
    String cityName = cityNameController.text;
    // String cityName = "dhaka";
    final queryparameter = {
      "q": cityName,
      "key": "48fef0441e8e4e48a3544424222011"
    };
    Uri uri = new Uri.http("api.weatherapi.com","/v1/current.json",queryparameter);
    final jsonData = await get(uri);
    final json = jsonDecode(jsonData.body);
    print(json);
    setState(() {
      currentCityName = json["location"]["name"];
      temperature = json["current"]["temp_c"];
      description = json["current"]["condition"]["text"];
      iconId = json["current"]["condition"]["icon"];
      iconId = iconId.substring(2);
    });
    print(iconId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text((currentCityName ?? "loading"),
                        style: const TextStyle(
                            fontSize: 30
                        )
                    ),
                    Text((temperature == null ? "loading" : temperature.toString())+"\u00B0C",
                      style: const TextStyle(
                          fontSize: 40
                      ),

                    ),
                    const SizedBox(height: 40,),
                    Text((description == null ? "loading" : description.toString()),
                      style: const TextStyle(
                          fontSize: 30
                      ),
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                        width: 300,
                        child:
                        TextField(
                          controller: cityNameController,
                        )
                    ),

                    const SizedBox(height: 80,),
                    ElevatedButton(onPressed: getWeather, child: const Text("Search")),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, '/forecast');
                    }, child: const Text("7-Days Forecast"))
                  ],
                ),
              ),
        )
    );
  }
}

