// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:task/HomeScreen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          " “We show weather for you”",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            },
            child: const Text("Skip"),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://www.vhv.rs/dpng/d/427-4270068_gold-retro-decorative-frame-png-free-download-transparent.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
