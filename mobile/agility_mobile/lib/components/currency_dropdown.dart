import 'package:flutter/material.dart';

class CurrencyDropdown extends StatefulWidget {
  final String labelText;

  const CurrencyDropdown({super.key, required this.labelText});

  @override
  CurrencyDropdownState createState() => CurrencyDropdownState();
}

class CurrencyDropdownState extends State<CurrencyDropdown> {
  final List<String> currencies = ['ARS', 'CAD', 'USD', 'EUR', 'GBP', 'BRL'];
  String? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCurrency,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      items:
          currencies.map((currency) {
            return DropdownMenuItem<String>(
              value: currency,
              child: Text(currency),
            );
          }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }
}
