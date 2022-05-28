import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/api_pequests.dart';
import '../widgets/character_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Character> characters = [];
  bool isDataLoading = false;
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(221, 225, 238, 1),
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (ScrollUpdateNotification notification) {
            if (notification.metrics.maxScrollExtent -
                        2 * MediaQuery.of(context).size.height <=
                    notification.metrics.pixels &&
                !isDataLoading) {
              isDataLoading = true;
              setState(() {});
            }
            return true;
          },
          child: ListView(
            addAutomaticKeepAlives: false,
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            children: [
              Container(
                height: 235,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/logo.svg"),
                          SvgPicture.asset("assets/night_mode.svg"),
                        ],
                      ),
                    ),
                    Stack(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 26),
                          child: Text(
                            'The Rick and Morty App',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Play',
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'Play',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Find character",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: FutureBuilder<List<Character>>(
                  future: Data.addCharacters(characters, page++),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      isDataLoading = false;
                    }
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  childAspectRatio: 7 / 10,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  maxCrossAxisExtent: 200),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CharacterCard(snapshot.data![index]);
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
