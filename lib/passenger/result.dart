import 'package:flutter/material.dart';
import '../components/footer.dart';
import '../components/constants.dart';
import '../components/searchbar.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kgrey,
        body: SafeArea(
          child: Column(
            children: const [
              SearchBar(),
              Expanded(
                child: OtherElements(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: FooterNavBar(),
        ));
  }
}

class OtherElements extends StatelessWidget {
  const OtherElements({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:[],
      ),
    );
  }
}
