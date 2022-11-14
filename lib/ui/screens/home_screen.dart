import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/models/movie.dart';
import 'package:netflix_app/repositories/data_repository.dart';
import 'package:provider/provider.dart';
import '/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? movies;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset("assets/images/netflix_logo_2.png"),
      ),
      body: ListView(
        children: [
          Container(
              height: 500,
              color: Colors.red,
              child: dataProvider.popularMovieiLst.isEmpty
                  ? const Center(child: Text('Not Movie'))
                  : Image.network(
                      dataProvider.popularMovieiLst[0].posterPathUrl(),
                      fit: BoxFit.cover,
                    )),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tendances Actuelles",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.yellowAccent,
                    width: 100,
                    child: dataProvider.popularMovieiLst.isEmpty
                        ? Center(child: Text(index.toString()))
                        : Image.network(
                            dataProvider.popularMovieiLst[index]
                                .posterPathUrl(),
                            fit: BoxFit.cover,
                          ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
