import 'package:agility_mobile/env/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return mainBody(context);
  }

  Widget mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [getHeaderBar(), const SizedBox(height: 40)],
      ),
    );
  }

  Widget getHeaderBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: 'logoTag',
            child:
                getFlavor() == Flavor.prod
                    ? Image.asset(
                      'assets/prod/app-icon-foreground.png',
                      height: 50,
                    )
                    : Image.asset(
                      'assets/stg/app-icon-foreground.png',
                      height: 50,
                    ),
          ),
          IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: SeachArtistDelegate());
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color:
                  UserPreferences().isDarkModeOn ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
