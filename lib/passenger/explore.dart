import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/constants.dart';
import '../components/footer.dart';
import '../components/searchbar.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kgrey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Explore',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
              CardDisplay(),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: FooterNavBar(),
        ));
  }
}

class CardDisplay extends StatefulWidget {
  const CardDisplay({super.key});

  @override
  State<CardDisplay> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://picsum.photos/200"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        color: kgrey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Title 1"),
                              SizedBox(height: 5.0),
                              Text(
                                "Location details 1",
                                selectionColor: kwhite,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
