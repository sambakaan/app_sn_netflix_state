import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: Image.asset("assets/images/netflix_logo_2.png"),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            color: Colors.red,
            child: const Text("je suis la "),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Tendances Actuelles",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.yellowAccent,
                    width: 100,
                    child: Text(index.toString()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
