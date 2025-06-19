import 'package:agility_mobile/components/amount_textbox.dart';
import 'package:agility_mobile/components/currency_dropdown.dart';
import 'package:agility_mobile/env/flavor.dart';
import 'package:flutter/material.dart';
import '../models/user_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controllerSell = TextEditingController();
  final TextEditingController controllerBuy = TextEditingController();
  bool isBuyEnabled = true;
  bool isSellEnabled = true;

  @override
  void initState() {
    super.initState();

    controllerSell.addListener(() {
      final hasValue = controllerSell.text.trim().isNotEmpty;
      setState(() {
        isBuyEnabled = !hasValue;
      });
    });

    controllerBuy.addListener(() {
      final hasValue = controllerBuy.text.trim().isNotEmpty;
      setState(() {
        isSellEnabled = !hasValue;
      });
    });
  }

  @override
  void dispose() {
    controllerSell.dispose();
    controllerBuy.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return mainBody(context);
  }

  Widget mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getHeaderBar(),
            const SizedBox(height: 40),
            CurrencyDropdown(labelText: 'Currency I have to sell'),
            const SizedBox(height: 10),
            AmountTextFormField(
              labelText: 'Amount',
              controller: controllerSell,
              enabled: isSellEnabled,
            ),
            const SizedBox(height: 20),
            CurrencyDropdown(labelText: 'Currency I need to buy'),
            const SizedBox(height: 10),
            AmountTextFormField(
              labelText: 'Amount',
              controller: controllerBuy,
              enabled: isBuyEnabled,
            ),
          ],
        ),
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
                      'assets/prod/app-icon-transparent.png',
                      height: 100,
                    )
                    : Image.asset(
                      'assets/stg/app-icon-transparent.png',
                      height: 100,
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
