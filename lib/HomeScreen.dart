// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task/Apicalling.dart';
import 'package:task/ModelClasses/WeatherData.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? controller;
  WeatherData? showData;
  var permission;
  @override
  void initState() {
    super.initState();
    permission = Permission.locationWhenInUse.request();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller,
              decoration:
                  const InputDecoration(hintText: "Enter yours location"),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () async {
                if (controller!.text.isEmpty) {
                  if (await Permission.location.request().isGranted) {
                    var latitude = "";
                    var longitude = "";
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.best);
                    latitude = position.latitude.toString();
                    longitude = position.longitude.toString();
                    await ApiCalling.getForecastByLan(latitude, longitude)
                        .then((value) {
                      showData = value;
                      setState(() {});
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Loaction access denied"),
                    ));
                  }
                } else {
                  await ApiCalling.getForecast(controller!.text.toString())
                      .then((value) {
                    showData = value;
                    setState(() {});
                  });
                }
              },
              child: const Text("Save/Update"),
            ),
            const Text("Temp_C"),
            showData != null
                ? Text(showData!.current!.tempC.toString())
                : const Text(""),
            const Text("condition"),
            showData != null
                ? Text(showData!.current!.condition!.text.toString())
                : const Text(""),
            showData != null
                ? Image.network(
                    "https:${showData!.current!.condition?.icon.toString()}")
                : const Text("")
          ],
        ),
      )),
    );
  }
}
