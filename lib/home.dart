import 'package:flutter/material.dart';
import 'package:weather_app_advanced/weather_model.dart';
import 'package:weather_app_advanced/weather_service.dart';

class weather_app extends StatefulWidget {
  const weather_app({Key? key}) : super(key: key);

  @override
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
  //List country1=["Kerala,Usa","UAE","INDIA","LONDON"];
  String country = "";
  List ltln = [0, 0];

  Weather w = new Weather();
  Weather_Data wd = new Weather_Data();
  TextEditingController _palcecontroller = TextEditingController();

  double t = 0;
  double f = 0;
  String condi = "";
  double lat = 0;
  double lon = 0;
  double windspd = 0;
  int hmdty = 0;
  String Winddirn = '';
  int cld = 0;
  double pressure = 0;
  double feellike_c = 0;
  String localtym = '';
  String location='';


  void initState() {
    super.initState();
    getWether('kozhikode');
  }

  void getWether(String place) async {
    w = await wd.getWeatherData("${place}");

    // country.toString()=='null'?"kerala":country.toString()

    setState(() {
      t = w.temperature_c;
      f = w.temperature_f;
      condi = w.condition;
      lat = w.latitude;
      lon = w.longitude;
      windspd = w.windspeed;
      hmdty = w.humidity;
      Winddirn = w.Winddirection;
      cld = w.cloud;
      pressure = w.pressure_in;
      feellike_c = w.feelslike_c;
      localtym = w.localtime;
      location=w.place;


      ltln.replaceRange(0, 2, [lat, lon]);
      print(lat);
      print(lon);
      print(ltln);
      weatherval.replaceRange(
          0, 6, [windspd, hmdty, Winddirn, cld, pressure, feellike_c]);

    });
  }

  List colr = [100, 100];
  List name = ["Latitude", "Longitude"];
  List latlon = [85.4, 65.76];

  List icn = [
    Icons.air_sharp,
    Icons.water_drop,
    Icons.wind_power_sharp,
    Icons.cloud,
    Icons.timer,
    Icons.sunny_snowing
  ];
  List names = [
    "Windspeed",
    "Humidity",
    "Winddirection",
    "Cloud",
    "Pressure",
    "Feelslike_c"
  ];
  List weatherval = [0.0, 0, "N", 0, 0.0, 0.0];
  List col = [100, 200, 300, 400, 500, 600];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/weather3.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    localtym,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: _palcecontroller,
                  decoration: InputDecoration(
                    suffix: IconButton(onPressed: (){
                      getWether('${_palcecontroller.text}');

                    },icon: Icon(Icons.search),),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.location_on_sharp,
                      size: 20,
                      color: Colors.black,
                    ),
                    label: Text("Search for location"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),

                  // onChanged: (value){
                  // setState(() {
                  //   place=value;
                  // });
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${location.toString()}",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Text(
                      "${t.toString()}\°C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                          color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloudy_snowing,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          condi,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemCount: name.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.green[colr[i]],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name[i],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              "${ltln[i]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Divider(color: Colors.white, thickness: 3),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 3.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                  ),
                  itemCount: icn.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.blue[col[i]],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icn[i],
                              size: 20,
                            ),
                            Text(
                              "${names[i]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              weatherval[i].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
