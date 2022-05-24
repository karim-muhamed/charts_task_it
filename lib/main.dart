import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ClicksPerDay {
  final String day;
  int clicks;
  final charts.Color color;

  ClicksPerDay(this.day, this.clicks, Color color)
      : color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);

  incrementClick() {
    clicks++;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var sat = "Sat";
  var sun = "Sun";
  var mon = "Mon";
  var tus = "Tus";
  var wed = "Wed";
  var thr = "Thr";
  var fri = "Fri";

  late Map<String, ClicksPerDay> data;
  int selectedValue = 0;

  @override
  void initState() {
    data = {
      sat: ClicksPerDay(sat, 10, Colors.black),
      sun: ClicksPerDay(sun, 40, Colors.blue),
      mon: ClicksPerDay(mon, 70, Colors.yellow),
      tus: ClicksPerDay(tus, 100, Colors.red),
      wed: ClicksPerDay(wed, 130, Colors.orange),
      thr: ClicksPerDay(thr, 160, Colors.indigo),
      fri: ClicksPerDay(fri, 190, Colors.teal),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var series = [
      charts.Series(
          domainFn: (ClicksPerDay clickData, _) => clickData.day,
          measureFn: (ClicksPerDay clickData, _) => clickData.clicks,
          colorFn: (ClicksPerDay clickData, _) => clickData.color,
          id: 'Clicks',
          data: data.values.toList()),
    ];
    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: const EdgeInsets.all(35.0),
      child: SizedBox(
        height: 300.0,
        child: chart,
      ),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          chartWidget,
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  isExtended: false,
                  onPressed: () {
                    setState(() {
                      data[sat]?.incrementClick();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    setState(() {
                      data[sun]?.incrementClick();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  onPressed: () {
                    setState(() {
                      data[mon]?.incrementClick();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      data[tus]?.incrementClick();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    setState(() {
                      data[wed]?.incrementClick();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    setState(() {
                      data[thr]?.incrementClick();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    setState(() {
                      data[fri]?.incrementClick();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
